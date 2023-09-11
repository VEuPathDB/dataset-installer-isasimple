#!/usr/bin/env bash

# exit when any command fails
set -e

biomMetadataFile=$1;
biomTsvFile=$2
userDatasetId=$3
metadataFile=$4

export NLS_LANG='AMERICAN_AMERICA.UTF8';

biomFilesToTsv.pl $biomTsvFile $biomMetadataFile

# basename of last directory modified
study="$(basename $(\ls -1dt ./*/ | head -n 1))"

GEO_MAPPINGS=/usr/local/lib/xml/geoMappings.xml
GEO_ARG=""
if test -f "$GEO_MAPPINGS"; then
    GEO_ARG="--ontologyMappingOverrideFile $GEO_MAPPINGS"
fi

externalDatabaseName=MicrobiomeStudyEDA_${study}_RSRC

ga GUS::Supported::Plugin::InsertExternalDatabase --name $externalDatabaseName --commit;
ga GUS::Supported::Plugin::InsertExternalDatabaseRls --databaseName $externalDatabaseName --databaseVersion dontcare --commit;

ga GUS::Supported::Plugin::InsertExternalDatabase --name "${externalDatabaseName}_terms" --commit;
ga GUS::Supported::Plugin::InsertExternalDatabaseRls --databaseName "${externalDatabaseName}_terms" --databaseVersion dontcare --commit;

touch $study/ontology_relationships.txt;

# always add lat and long to ontology_terms just in case
perl -I $GUS_HOME/lib/perl -e 'use ApiCommonData::Load::StudyUtils; print ${ApiCommonData::Load::StudyUtils::latitudeSourceId} . "\t" . "latitude" . "\n";' >>ontology_terms.txt
perl -I $GUS_HOME/lib/perl -e 'use ApiCommonData::Load::StudyUtils; print ${ApiCommonData::Load::StudyUtils::longitudeSourceId} . "\t" . "longitude" . "\n";' >>ontology_terms.txt

ga ApiCommonData::Load::Plugin::InsertOntologyFromTabDelimUD \
    --termFile $study/ontology_terms.txt \
    --relFile $study/ontology_relationships.txt \
    --extDbRlsSpec "${externalDatabaseName}_terms|dontcare" \
    --commit

ga ApiCommonData::Load::Plugin::MBioInsertEntityGraph $GEO_ARG \
  --commit \
  --investigationFile $PWD/$study/investigation.xml \
  --sampleDetailsFile $PWD/$study/source.tsv \
  --mbioResultsDir $PWD/$study/results  \
  --mbioResultsFileExtensions '{ampliconTaxa => "abundance.tsv", wgsTaxa => "NA", level4ECs => "NA", pathwayAbundances => "NA", pathwayCoverages => "NA", eukdetectCpms => "NA", massSpec => "NA" }' \
  --dieOnFirstError 1 \
  --ontologyMappingFile $PWD/$study/ontologyMapping.xml \
  --extDbRlsSpec "${externalDatabaseName}|dontcare" \
  --schema ApidbUserDatasets \
  --userDatasetId $userDatasetId

ga ApiCommonData::Load::Plugin::LoadAttributesFromEntityGraph \
    --extDbRlsSpec "${externalDatabaseName}|dontcare" \
    --schema ApidbUserDatasets \
    --ontologyExtDbRlsSpec "${externalDatabaseName}_terms|dontcare" \
    --logDir $PWD \
    --runRLocally \
    --commit

ga ApiCommonData::Load::Plugin::LoadEntityTypeAndAttributeGraphs \
    --logDir $PWD \
    --extDbRlsSpec "${externalDatabaseName}|dontcare" \
    --schema ApidbUserDatasets \
    --ontologyExtDbRlsSpec "${externalDatabaseName}_terms|dontcare" \
    --commit

 ga ApiCommonData::Load::Plugin::LoadDatasetSpecificEntityGraph \
    --extDbRlsSpec "${externalDatabaseName}|dontcare" \
    --schema ApidbUserDatasets \
    --commit

 ga ApiCommonData::Load::Plugin::InsertUserDatasetAttributes \
     --userDatasetId $userDatasetId \
     --metadataFile $metadataFile \
     --commit

 # This is temporary solution;  remove when merge with megastudy branch
 updateHasCollections.pl $userDatasetId

 # clean out tables not used by the application with partial delete
 deleteStudy.pl $userDatasetId 1

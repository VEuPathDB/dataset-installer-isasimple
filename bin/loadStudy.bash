#!/usr/bin/env bash

# exit when any command fails
set -e

inputFileOrDir=$1;
userDatasetId=$2
metadataFile=$3


export NLS_LANG='AMERICAN_AMERICA.UTF8';

exportInvestigation.pl -a -m $inputFileOrDir

# basename of last directory modified
study="$(basename $(\ls -1dt ./*/ | head -n 1))"

GEO_MAPPINGS=/usr/local/lib/xml/geoMappings.xml
GEO_ARG=""
if test -f "$GEO_MAPPINGS"; then
    cp $GEO_MAPPINGS $study/
    GEO_ARG="--ontologyMappingOverrideFileBaseName $PWD/$study/geoMappings.xml"
fi

ontologyTermsToTabDelim.pl ${study}/ontologyMapping.xml ${study}

ga ApiCommonData::Load::Plugin::InsertExternalDatabaseUD --name $study --commit;
ga ApiCommonData::Load::Plugin::InsertExternalDatabaseRlsUD --databaseName $study --databaseVersion dontcare --commit;

ga ApiCommonData::Load::Plugin::InsertExternalDatabaseUD --name "${study}_terms" --commit;
ga ApiCommonData::Load::Plugin::InsertExternalDatabaseRlsUD --databaseName "${study}_terms" --databaseVersion dontcare --commit;

# always add lat and long to ontology_terms just in case.
geoTermsAndRelationships.pl --output_type term >$study/ontology_terms.txt.geohash
geoTermsAndRelationships.pl --output_type relationship --ontology_terms $study/ontology_terms.txt --ontology_relationships $study/ontology_relationships.txt >$study/ontology_relationships.txt.geohash

cat $study/ontology_terms.txt.geohash >> $study/ontology_terms.txt
cat $study/ontology_relationships.txt.geohash >>$study/ontology_relationships.txt

ga ApiCommonData::Load::Plugin::InsertOntologyFromTabDelimUD \
    --termFile $study/ontology_terms.txt \
    --relFile $study/ontology_relationships.txt \
    --extDbRlsSpec "${study}_terms|dontcare" \
    --commit

#touch $PWD/$study/valueMapping.txt
#touch $PWD/$study/termOverride.xml

ga ApiCommonData::Load::Plugin::InsertEntityGraph $GEO_ARG \
    --metaDataRoot $PWD \
    --investigationSubset $study \
    --investigationBaseName investigation.xml \
    --isSimpleConfiguration \
    --ontologyMappingFile $PWD/$study/ontologyMapping.xml \
    --extDbRlsSpec "${study}|dontcare" \
    --dateObfuscationFile $PWD/$study/dateObfuscation.txt \
    --schema ApidbUserDatasets \
    --userDatasetId $userDatasetId \
    --commit #    --valueMappingFile $PWD/$study/valueMapping.txt


ga ApiCommonData::Load::Plugin::LoadAttributesFromEntityGraph \
    --extDbRlsSpec "${study}|dontcare" \
    --schema ApidbUserDatasets \
    --ontologyExtDbRlsSpec "${study}_terms|dontcare" \
    --logDir $PWD \
    --runRLocally \
    --commit

ga ApiCommonData::Load::Plugin::LoadEntityTypeAndAttributeGraphs \
    --logDir $PWD \
    --extDbRlsSpec "${study}|dontcare" \
    --schema ApidbUserDatasets \
    --ontologyExtDbRlsSpec "${study}_terms|dontcare" \
    --commit

 ga ApiCommonData::Load::Plugin::LoadDatasetSpecificEntityGraph \
    --extDbRlsSpec "${study}|dontcare" \
    --schema ApidbUserDatasets \
    --commit

 ga ApiCommonData::Load::Plugin::InsertUserDatasetAttributes \
     --userDatasetId $userDatasetId \
     --metadataFile $metadataFile \
     --commit

 # clean out tables not used by the application with partial delete
 deleteStudy.pl $userDatasetId 1

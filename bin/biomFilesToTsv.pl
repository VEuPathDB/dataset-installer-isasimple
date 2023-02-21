#!/usr/bin/perl

use strict;

use lib "$ENV{GUS_HOME}/lib/perl";
use JSON;
use Data::Dumper;
use File::Temp qw/tempfile tempdir/;

use POSIX qw/strftime/;

my @MATERIAL_TYPES;
my @CHAR_QUALIFIERS;

my %taxaSourceIds = ('EUPATH_0009251' => "Kingdom",
                     'EUPATH_0009252' => "Phylum",
                     'EUPATH_0009253' => "Class",
                     'EUPATH_0009254' => "Order",
                     'EUPATH_0009255' => "Family",
                     'EUPATH_0009256' => "Genus",
                     'EUPATH_0009257' => "Species",
    );



my $relAbundanceSourceId = "EUPATH_0009250";
my $relAbundanceDesc = "Relative taxonomic abundance analysis";

my $data = $ARGV[0];
my $metaDataJson = $ARGV[1];

my $timestamp = strftime("%Y%m%d%H%M%S", localtime);

my $dir = tempdir("auto_${timestamp}_XXXX", CLEANUP => 0);

mkdir "$dir/results";


my $sourceFile = "source.tsv";
my $ontologyTermsFile = "ontology_terms.txt";
my $ontologyRelationshipsFile = "ontology_relationships.txt";
my $ontologyMappingFile = "ontologyMapping.xml";
my $sourceType = "Source";
my $abundanceFile = "${dir}.${sourceType}.abundance.tsv";

&printInvestigationXml($dir, $sourceFile, $sourceType);

open(FILE, $data) or die "Cannot open file $data for reading: $!";

open(TERMS, ">$dir/$ontologyTermsFile") or die "Cannot open file $dir/$ontologyTermsFile for writing: $!";
open(RELS, ">$dir/$ontologyRelationshipsFile") or die "Cannot open file $dir/$ontologyRelationshipsFile for writing: $!";
open(MAP, ">$dir/$ontologyMappingFile") or die "Cannot open file $dir/$ontologyMappingFile for writing: $!";

print TERMS &makeTermLine($sourceType, undef, 'mt');

my @data = ();
while(<FILE>) {
    chomp;
    my ($row, $col, $val) =  split(/\t/, $_);

    $data[$row][$col] = $val;
}

my $json;
{
    local $/;
    open my $fh, '<', $metaDataJson or die "can't open $metaDataJson: $!";
    $json = <$fh>;
}

my $decodedJson = decode_json($json);

my $variables = &getDistinctVariables($decodedJson->{columns});

foreach(@$variables) {
    print TERMS &makeTermLine($_, undef, 'char');
}

foreach(keys %taxaSourceIds) {
    print TERMS &makeTermLine($_, $taxaSourceIds{$_}, 'taxa');
}

print TERMS &makeTermLine($relAbundanceSourceId, $relAbundanceDesc, 'taxa');

my $sourceOut;
open($sourceOut, ">$dir/$sourceFile") or die "Cannot open file abundance.tsv for writing:$!";

my $tsvOut;
open($tsvOut, ">$dir/results/$abundanceFile") or die "Cannot open file abundance.tsv for writing:$!";

my @ids = map {$_->{id}} @{$decodedJson->{columns}};

print $sourceOut "$sourceType\t" . join("\t", @$variables) . "\n";

foreach my $col (@{$decodedJson->{columns}}) {
    my $metadata = $col->{metadata};
    my $id = $col->{id};

    print $sourceOut "$id\t" . join("\t", map { "MBIOTEMP_" . $metadata->{$_} } @$variables) . "\n";
}

print $tsvOut "\t", join("\t", @ids) . "\n";

for(my $i = 0; $i < @{$decodedJson->{rows}}; $i++) {

    my $taxonomyAr = $decodedJson->{rows}->[$i]->{metadata}->{Taxonomy};

    my @line;
    push @line, join(";", @$taxonomyAr);

    for(my $j = 0; $j < @ids; $j++) {
        push @line, $data[$i][$j];
    }
    print $tsvOut join("\t", @line) . "\n";
}

close $tsvOut;
close $sourceOut;
close TERMS;

print MAP "<ontologymappings>\n";

foreach(@MATERIAL_TYPES) {
    print MAP <<MT
 <ontologyTerm source_id="MBIOTEMP_${_}" type="materialType">
    <name>${_}</name>
  </ontologyTerm>
MT
}
foreach(@CHAR_QUALIFIERS) {
    print MAP <<CHAR;
  <ontologyTerm parent="Source" source_id="MBIOTEMP_${_}" type="characteristicQualifier">
    <name>${_}</name>
  </ontologyTerm>
CHAR

      print RELS "MBIOTEMP_${_}\tsubClassOf\tMBIOTEMP_${sourceType}\n";
}

foreach(keys %taxaSourceIds) {
    print MAP <<CHAR;
  <ontologyTerm parent="Source" source_id="${_}" type="characteristicQualifier">
        <name>$taxaSourceIds{$_}</name>
        <name>${_}</name>
   </ontologyTerm>
CHAR

      print RELS "${_}\tsubClassOf\t$relAbundanceSourceId\n";
}


print MAP "</ontologymappings>\n";

sub printInvestigationXml {
    my ($investigationDir, $sourceFile, $sourceType) = @_;

    my $xml = <<XML;
<investigation identifier="$investigationDir">

  <study fileName="$sourceFile" identifierSuffix="-1">

    <dataset>MicrobiomeStudyEDA_${investigationDir}_RSRC</dataset>
    <node name="$sourceType" type="$sourceType" suffix="$sourceType" idColumn="$sourceType" />

  </study>
</investigation>
XML

    open(XML, ">$investigationDir/investigation.xml") or die "Cannot open file $investigationDir/investigation.xml for writing: $!";

    print XML $xml;

    close XML;
}


sub makeTermLine {
    my ($term, $name, $type) = @_;


    if($type eq 'mt') {
        push @MATERIAL_TYPES, $term;
    }
    elsif($type eq 'char') {
        push @CHAR_QUALIFIERS, $term;
    }
    elsif($type eq 'taxa') {}

    else {
        die "unhandled Type for variable: $term, Type=$type";
    }

    if($name) {
        return "$term\t$name\n";
    }

    return "MBIOTEMP_$term\t$term\n";
}

sub getDistinctVariables {
    my ($columns) = @_;

    my %vars;

    foreach(@$columns) {
        my $metadata = $_->{metadata};

        foreach(keys %$metadata) {
            $vars{$_}++;
        }
    }

    my @variables = keys %vars;

    return \@variables
}

1;

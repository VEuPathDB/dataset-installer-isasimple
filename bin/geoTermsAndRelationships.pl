#!/usr/bin/perl

use strict;

use lib "$ENV{GUS_HOME}/lib/perl";

use File::Basename;

use Getopt::Long;

use ApiCommonData::Load::StudyUtils;

my ($outputType, $attributeGraphRootFile, $attributeGraphRootId);
&GetOptions('output_type=s' => \$outputType,
            'attributeGraphRootFile=s' => \$attributeGraphRootFile,
            'attributeGraphRootId=s' => \$attributeGraphRootId,
    );

if($outputType eq 'term') {
    print ${ApiCommonData::Load::StudyUtils::latitudeSourceId} . "\t" . "latitude" . "\n";
    print ${ApiCommonData::Load::StudyUtils::longitudeSourceId} . "\t" . "longitude" . "\n";
    while(my ($geohash, $prec) = each %${ApiCommonData::Load::StudyUtils::GEOHASH_PRECISION}) {
        print $geohash . "\t" . "GEOHASH $prec\n";
    }
}
elsif($outputType eq 'relationship') {
    my $attributeGraphRoot;
    if($attributeGraphRootFile) {
        $attributeGraphRoot = lc(basename $attributeGraphRootFile);
        $attributeGraphRoot =~ s/\.[^.]+$//;
        $attributeGraphRoot = "TEMP_${attributeGraphRoot}";
    }
    elsif($attributeGraphRootId) {
        $attributeGraphRoot = $attributeGraphRootId;
    }
    else {
        die "Must provide Either an attribute graph root file or id";
    }

    print ${ApiCommonData::Load::StudyUtils::latitudeSourceId} . "\tsubClassOf\t" . $attributeGraphRoot . "\n";
    print ${ApiCommonData::Load::StudyUtils::longitudeSourceId} .  "\tsubClassOf\t" . $attributeGraphRoot . "\n";
    while(my ($geohash, $prec) = each %${ApiCommonData::Load::StudyUtils::GEOHASH_PRECISION}) {
        print $geohash  . "\tsubClassOf\t" . $attributeGraphRoot . "\n";;
    }
}
else {
    die "output_type must be either 'term' or 'relationship'";
}

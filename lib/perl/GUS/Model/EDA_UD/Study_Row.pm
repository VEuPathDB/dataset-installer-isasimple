package GUS::Model::EDA_UD::Study_Row;

# THIS CLASS HAS BEEN AUTOMATICALLY GENERATED BY THE GUS::ObjRelP::Generator 
# PACKAGE.
#
# DO NOT EDIT!!

use strict;
use GUS::Model::GusRow;

use vars qw (@ISA);
@ISA = qw (GUS::Model::GusRow);

sub setDefaultParams {
  my ($self) = @_;
  $self->setVersionable(0);
  $self->setUpdateable(1);
}

sub setStudyId {
  my($self,$value) = @_;
  $self->set("study_id",$value);
}

sub getStudyId {
    my($self) = @_;
  return $self->get("study_id");
}

sub setStableId {
  my($self,$value) = @_;
  $self->set("stable_id",$value);
}

sub getStableId {
    my($self) = @_;
  return $self->get("stable_id");
}

sub setExternalDatabaseReleaseId {
  my($self,$value) = @_;
  $self->set("external_database_release_id",$value);
}

sub getExternalDatabaseReleaseId {
    my($self) = @_;
  return $self->get("external_database_release_id");
}

sub setInternalAbbrev {
  my($self,$value) = @_;
  $self->set("internal_abbrev",$value);
}

sub getInternalAbbrev {
    my($self) = @_;
  return $self->get("internal_abbrev");
}

sub setMaxAttrLength {
  my($self,$value) = @_;
  $self->set("max_attr_length",$value);
}

sub getMaxAttrLength {
    my($self) = @_;
  return $self->get("max_attr_length");
}

sub setModificationDate {
  my($self,$value) = @_;
  $self->set("modification_date",$value);
}

sub getModificationDate {
    my($self) = @_;
  return $self->get("modification_date");
}

sub setUserRead {
  my($self,$value) = @_;
  $self->set("user_read",$value);
}

sub getUserRead {
    my($self) = @_;
  return $self->get("user_read");
}

sub setUserWrite {
  my($self,$value) = @_;
  $self->set("user_write",$value);
}

sub getUserWrite {
    my($self) = @_;
  return $self->get("user_write");
}

sub setGroupRead {
  my($self,$value) = @_;
  $self->set("group_read",$value);
}

sub getGroupRead {
    my($self) = @_;
  return $self->get("group_read");
}

sub setGroupWrite {
  my($self,$value) = @_;
  $self->set("group_write",$value);
}

sub getGroupWrite {
    my($self) = @_;
  return $self->get("group_write");
}

sub setOtherRead {
  my($self,$value) = @_;
  $self->set("other_read",$value);
}

sub getOtherRead {
    my($self) = @_;
  return $self->get("other_read");
}

sub setOtherWrite {
  my($self,$value) = @_;
  $self->set("other_write",$value);
}

sub getOtherWrite {
    my($self) = @_;
  return $self->get("other_write");
}

sub setRowUserId {
  my($self,$value) = @_;
  $self->set("row_user_id",$value);
}

sub getRowUserId {
    my($self) = @_;
  return $self->get("row_user_id");
}

sub setRowGroupId {
  my($self,$value) = @_;
  $self->set("row_group_id",$value);
}

sub getRowGroupId {
    my($self) = @_;
  return $self->get("row_group_id");
}

sub setRowProjectId {
  my($self,$value) = @_;
  $self->set("row_project_id",$value);
}

sub getRowProjectId {
    my($self) = @_;
  return $self->get("row_project_id");
}

sub setRowAlgInvocationId {
  my($self,$value) = @_;
  $self->set("row_alg_invocation_id",$value);
}

sub getRowAlgInvocationId {
    my($self) = @_;
  return $self->get("row_alg_invocation_id");
}

sub setUserDatasetId {
  my($self,$value) = @_;
  $self->set("user_dataset_id",$value);
}

sub getUserDatasetId {
    my($self) = @_;
  return $self->get("user_dataset_id");
}

1;
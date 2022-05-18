package GUS::Model::EDA_UD::StudyDataset_Row;

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

sub setStudyDatasetId {
  my($self,$value) = @_;
  $self->set("study_dataset_id",$value);
}

sub getStudyDatasetId {
    my($self) = @_;
  return $self->get("study_dataset_id");
}

sub setUserDatasetId {
  my($self,$value) = @_;
  $self->set("user_dataset_id",$value);
}

sub getUserDatasetId {
    my($self) = @_;
  return $self->get("user_dataset_id");
}

sub setStudyStableId {
  my($self,$value) = @_;
  $self->set("study_stable_id",$value);
}

sub getStudyStableId {
    my($self) = @_;
  return $self->get("study_stable_id");
}

sub setDatasetStableId {
  my($self,$value) = @_;
  $self->set("dataset_stable_id",$value);
}

sub getDatasetStableId {
    my($self) = @_;
  return $self->get("dataset_stable_id");
}

sub setName {
  my($self,$value) = @_;
  $self->set("name",$value);
}

sub getName {
    my($self) = @_;
  return $self->get("name");
}

sub setDescription {
  my($self,$value) = @_;
  $self->set("description",$value);
}

sub getDescription {
    my($self) = @_;
  return $self->get("description");
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

1;
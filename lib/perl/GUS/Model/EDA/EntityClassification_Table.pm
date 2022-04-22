package GUS::Model::EDA::EntityClassification_Table;

# THIS CLASS HAS BEEN AUTOMATICALLY GENERATED BY THE GUS::ObjRelP::Generator 
# PACKAGE.
#
# DO NOT EDIT!!


use strict;
use GUS::ObjRelP::DbiTable;
use vars qw (@ISA);
@ISA = qw (GUS::ObjRelP::DbiTable);

sub setDefaultParams {
  my $self = shift;
  $self->setChildList();

  $self->setParentList(
      ['GUS::Model::EDA::EntityAttributes','entity_attributes_id','entity_attributes_id'],
      ['GUS::Model::EDA::EntityType','entity_type_id','entity_type_id'],
      ['GUS::Model::Core::AlgorithmInvocation','row_alg_invocation_id','algorithm_invocation_id'],
      ['GUS::Model::Core::GroupInfo','row_group_id','group_id'],
      ['GUS::Model::Core::UserInfo','row_user_id','user_id'],
      ['GUS::Model::Core::ProjectInfo','row_project_id','project_id']);

  $self->setAttributeNames(
      'entity_classification_id',
      'entity_attributes_id',
      'entity_type_id',
      'modification_date',
      'user_read',
      'user_write',
      'group_read',
      'group_write',
      'other_read',
      'other_write',
      'row_user_id',
      'row_group_id',
      'row_project_id',
      'row_alg_invocation_id');

  $self->setQuotedAtts(
      'modification_date');

  $self->setAttInfo(
      {'col' => 'entity_classification_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'entity_attributes_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'entity_type_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'modification_date', 'type' => 'DATE', 'prec' => '', 'length' => 7, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'user_read', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'user_write', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'group_read', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'group_write', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'other_read', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'other_write', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'row_user_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'row_group_id', 'type' => 'NUMBER', 'prec' => 3, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'row_project_id', 'type' => 'NUMBER', 'prec' => 4, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'row_alg_invocation_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'});

  $self->setRealTableName('GUS::Model::EDA::EntityClassification');

  $self->setIsView(0);

  $self->setParentRelations(
      ['GUS::Model::EDA::EntityAttributes','entity_attributes_id','entity_attributes_id'], 
      ['GUS::Model::EDA::EntityType','entity_type_id','entity_type_id'], 
      ['GUS::Model::Core::AlgorithmInvocation','row_alg_invocation_id','algorithm_invocation_id'], 
      ['GUS::Model::Core::GroupInfo','row_group_id','group_id'], 
      ['GUS::Model::Core::UserInfo','row_user_id','user_id'], 
      ['GUS::Model::Core::ProjectInfo','row_project_id','project_id']);

  $self->setChildRelations();

  $self->setHasSequence(0);

  $self->setPrimaryKeyList('entity_classification_id');

}

1;


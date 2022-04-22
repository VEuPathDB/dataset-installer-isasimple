package GUS::Model::EDA::Attribute_Table;

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
      ['GUS::Model::EDA::EntityType','entity_type_id','entity_type_id'],
      ['GUS::Model::SRes::OntologyTerm','ontology_term_id','ontology_term_id'],
      ['GUS::Model::SRes::OntologyTerm','parent_ontology_term_id','ontology_term_id'],
      ['GUS::Model::EDA::ProcessType','process_type_id','process_type_id'],
      ['GUS::Model::SRes::OntologyTerm','unit_ontology_term_id','ontology_term_id'],
      ['GUS::Model::Core::AlgorithmInvocation','row_alg_invocation_id','algorithm_invocation_id'],
      ['GUS::Model::Core::GroupInfo','row_group_id','group_id'],
      ['GUS::Model::Core::UserInfo','row_user_id','user_id'],
      ['GUS::Model::Core::ProjectInfo','row_project_id','project_id']);

  $self->setAttributeNames(
      'attribute_id',
      'entity_type_id',
      'entity_type_stable_id',
      'process_type_id',
      'ontology_term_id',
      'parent_ontology_term_id',
      'stable_id',
      'display_name',
      'data_type',
      'distinct_values_count',
      'is_multi_valued',
      'data_shape',
      'unit',
      'unit_ontology_term_id',
      'precision',
      'ordered_values',
      'range_min',
      'range_max',
      'bin_width',
      'mean',
      'median',
      'lower_quartile',
      'upper_quartile',
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
      'lower_quartile',
      'stable_id',
      'ordered_values',
      'entity_type_stable_id',
      'range_max',
      'median',
      'mean',
      'display_name',
      'bin_width',
      'modification_date',
      'upper_quartile',
      'data_type',
      'unit',
      'data_shape',
      'range_min');

  $self->setAttInfo(
      {'col' => 'attribute_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'entity_type_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'entity_type_stable_id', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 255, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'process_type_id', 'type' => 'NUMBER', 'prec' => 12, 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'ontology_term_id', 'type' => 'NUMBER', 'prec' => 10, 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'parent_ontology_term_id', 'type' => 'NUMBER', 'prec' => 10, 'length' => 22, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'stable_id', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 255, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'display_name', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 1500, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'data_type', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 10, 'Nulls' => 0, 'base_type' => 'not set'}, 
      {'col' => 'distinct_values_count', 'type' => 'NUMBER', 'prec' => '', 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'is_multi_valued', 'type' => 'NUMBER', 'prec' => 1, 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'data_shape', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 30, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'unit', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 30, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'unit_ontology_term_id', 'type' => 'NUMBER', 'prec' => 10, 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'precision', 'type' => 'NUMBER', 'prec' => '', 'length' => 22, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'ordered_values', 'type' => 'CLOB', 'prec' => '', 'length' => 4000, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'range_min', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'range_max', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'bin_width', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'mean', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'median', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'lower_quartile', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
      {'col' => 'upper_quartile', 'type' => 'VARCHAR2', 'prec' => '', 'length' => 16, 'Nulls' => 1, 'base_type' => 'not set'}, 
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

  $self->setRealTableName('GUS::Model::EDA::Attribute');

  $self->setIsView(0);

  $self->setParentRelations(
      ['GUS::Model::EDA::EntityType','entity_type_id','entity_type_id'], 
      ['GUS::Model::SRes::OntologyTerm','ontology_term_id','ontology_term_id'], 
      ['GUS::Model::SRes::OntologyTerm','parent_ontology_term_id','ontology_term_id'], 
      ['GUS::Model::EDA::ProcessType','process_type_id','process_type_id'], 
      ['GUS::Model::SRes::OntologyTerm','unit_ontology_term_id','ontology_term_id'], 
      ['GUS::Model::Core::AlgorithmInvocation','row_alg_invocation_id','algorithm_invocation_id'], 
      ['GUS::Model::Core::GroupInfo','row_group_id','group_id'], 
      ['GUS::Model::Core::UserInfo','row_user_id','user_id'], 
      ['GUS::Model::Core::ProjectInfo','row_project_id','project_id']);

  $self->setChildRelations();

  $self->setHasSequence(0);

  $self->setPrimaryKeyList('attribute_id');

}

1;


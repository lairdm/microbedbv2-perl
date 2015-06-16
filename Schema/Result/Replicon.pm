use utf8;
package MicrobedbV2::Schema::Result::Replicon;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::Replicon

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<replicon>

=cut

__PACKAGE__->table("replicon");

=head1 ACCESSORS

=head2 rpv_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 gpv_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 version_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rep_accnum

  data_type: 'char'
  is_nullable: 1
  size: 14

=head2 rep_version

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 definition

  data_type: 'text'
  is_nullable: 1

=head2 rep_type

  data_type: 'enum'
  extra: {list => ["chromosome","plasmid","contig"]}
  is_nullable: 1

=head2 rep_ginum

  data_type: 'tinytext'
  is_nullable: 1

=head2 file_name

  data_type: 'text'
  is_nullable: 1

=head2 file_types

  data_type: 'text'
  is_nullable: 1

=head2 cds_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 gene_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rep_size

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rna_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "rpv_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "gpv_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "version_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rep_accnum",
  { data_type => "char", is_nullable => 1, size => 14 },
  "rep_version",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "definition",
  { data_type => "text", is_nullable => 1 },
  "rep_type",
  {
    data_type => "enum",
    extra => { list => ["chromosome", "plasmid", "contig"] },
    is_nullable => 1,
  },
  "rep_ginum",
  { data_type => "tinytext", is_nullable => 1 },
  "file_name",
  { data_type => "text", is_nullable => 1 },
  "file_types",
  { data_type => "text", is_nullable => 1 },
  "cds_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "gene_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "rep_size",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "rna_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</rpv_id>

=back

=cut

__PACKAGE__->set_primary_key("rpv_id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4U0XbTGGbuC6WG3MbgBxnw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

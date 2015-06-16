use utf8;
package MicrobedbV2::Schema::Result::Genomeproject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::Genomeproject

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<genomeproject>

=cut

__PACKAGE__->table("genomeproject");

=head1 ACCESSORS

=head2 gpv_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 assembly_accession

  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 asm_name

  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 genome_name

  data_type: 'text'
  is_nullable: 0

=head2 version_id

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 bioproject

  data_type: 'varchar'
  is_nullable: 1
  size: 14

=head2 biosample

  data_type: 'varchar'
  is_nullable: 1
  size: 14

=head2 taxid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 species_taxid

  data_type: 'integer'
  is_nullable: 1

=head2 org_name

  data_type: 'text'
  is_nullable: 1

=head2 infraspecific_name

  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 submitter

  data_type: 'text'
  is_nullable: 1

=head2 release_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 gpv_directory

  data_type: 'text'
  is_nullable: 1

=head2 filename

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 file_types

  data_type: 'text'
  is_nullable: 1

=head2 prev_gpv

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "gpv_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "assembly_accession",
  { data_type => "varchar", is_nullable => 0, size => 16 },
  "asm_name",
  { data_type => "varchar", is_nullable => 0, size => 12 },
  "genome_name",
  { data_type => "text", is_nullable => 0 },
  "version_id",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "bioproject",
  { data_type => "varchar", is_nullable => 1, size => 14 },
  "biosample",
  { data_type => "varchar", is_nullable => 1, size => 14 },
  "taxid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "species_taxid",
  { data_type => "integer", is_nullable => 1 },
  "org_name",
  { data_type => "text", is_nullable => 1 },
  "infraspecific_name",
  { data_type => "varchar", is_nullable => 1, size => 24 },
  "submitter",
  { data_type => "text", is_nullable => 1 },
  "release_date",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "gpv_directory",
  { data_type => "text", is_nullable => 1 },
  "filename",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "file_types",
  { data_type => "text", is_nullable => 1 },
  "prev_gpv",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</gpv_id>

=back

=cut

__PACKAGE__->set_primary_key("gpv_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<assembly_index>

=over 4

=item * L</assembly_accession>

=item * L</asm_name>

=item * L</version_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "assembly_index",
  ["assembly_accession", "asm_name", "version_id"],
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9JY82yDmUo2XsqbQrmb1uw
__PACKAGE__->has_one('genomeproject_meta', 'MicrobedbV2::Schema::Result::GenomeprojectMeta', { 'foreign.gpv_id' => 'self.gpv_id' }, {cascade_delete =>0} );
__PACKAGE__->has_many('genomeproject_checksum', 'MicrobedbV2::Schema::Result::GenomeprojectChecksum', { 'foreign.gpv_id' => 'self.gpv_id' }, {cascade_delete =>0} );
__PACKAGE__->has_many('replicons', 'MicrobedbV2::Schema::Result::Replicon', { 'foreign.gpv_id' => 'self.gpv_id' }, {cascade_delete =>0} );


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

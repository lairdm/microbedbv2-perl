use utf8;
package MicrobedbV2::Schema::Result::GenomeprojectChecksum;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::GenomeprojectChecksum

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<genomeproject_checksum>

=cut

__PACKAGE__->table("genomeproject_checksum");

=head1 ACCESSORS

=head2 version

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 filename

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 checksum

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=head2 gpv_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "version",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "filename",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 64 },
  "checksum",
  { data_type => "varchar", is_nullable => 1, size => 32 },
  "gpv_id",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</version>

=item * L</filename>

=back

=cut

__PACKAGE__->set_primary_key("version", "filename");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2s7ZpRvVjOjhZm+ttyl+MA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

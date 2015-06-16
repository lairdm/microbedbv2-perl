use utf8;
package MicrobedbV2::Schema::Result::Taxonomy;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::Taxonomy

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<taxonomy>

=cut

__PACKAGE__->table("taxonomy");

=head1 ACCESSORS

=head2 taxon_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 superkingdom

  data_type: 'tinytext'
  is_nullable: 1

=head2 phylum

  data_type: 'tinytext'
  is_nullable: 1

=head2 tax_class

  data_type: 'tinytext'
  is_nullable: 1

=head2 order

  data_type: 'tinytext'
  is_nullable: 1

=head2 family

  data_type: 'tinytext'
  is_nullable: 1

=head2 genus

  data_type: 'tinytext'
  is_nullable: 1

=head2 species

  data_type: 'tinytext'
  is_nullable: 1

=head2 other

  data_type: 'tinytext'
  is_nullable: 1

=head2 synonyms

  data_type: 'tinytext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "taxon_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "superkingdom",
  { data_type => "tinytext", is_nullable => 1 },
  "phylum",
  { data_type => "tinytext", is_nullable => 1 },
  "tax_class",
  { data_type => "tinytext", is_nullable => 1 },
  "order",
  { data_type => "tinytext", is_nullable => 1 },
  "family",
  { data_type => "tinytext", is_nullable => 1 },
  "genus",
  { data_type => "tinytext", is_nullable => 1 },
  "species",
  { data_type => "tinytext", is_nullable => 1 },
  "other",
  { data_type => "tinytext", is_nullable => 1 },
  "synonyms",
  { data_type => "tinytext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</taxon_id>

=back

=cut

__PACKAGE__->set_primary_key("taxon_id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pUyLBtplUpJUKZ0EqHg8hw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

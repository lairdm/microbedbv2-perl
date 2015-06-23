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

__PACKAGE__->belongs_to('genomeproject', 'MicrobedbV2::Schema::Result::Genomeproject', 'gpv_id');

use File::Spec;

# Overload a Replicon result object, I hope...

sub get_filename {
    my ($self, $file_suffix) = @_;

    #check to see if the file type is available for this replicon
    unless($self->file_types =~ /( |^)\.$file_suffix( |$)/){
        return undef;	
    }

    my $file_name = File::Spec->catpath(undef, $self->genomeproject->gpv_directory, $self->file_name . ".$file_suffix");

    return $file_name;
}


__PACKAGE__->resultset_class('MicrobedbV2::Schema::Replicon::ResultSet');

package MicrobedbV2::Schema::Replicon::ResultSet;
use base 'DBIx::Class::ResultSet';

# We have a special case with the Replicon objects,
# some old pipelines expect to see a version number
# attached to a RefSeq accession (ie NC_111111.2),
# so if we get one of those we need to munge the
# search so it's chopped off and search the 
# rep_version column instead for the version piece.

sub search {
    my $self = shift;

    # If we have column searches defined, we'll see if we
    # need to munge rep_accnum to shop off a version
    if( defined $_[0] ) {
        my $search_columns = shift @_;

        if( my $rep_accnum = delete $search_columns->{rep_accnum} ) {
            # See if we have a version attached to the rep_accnum
            my ($accnum, $version) = split '\.', $rep_accnum;

            # Now that we've tried to split based on a period,
            # add the accnum back in, and then try to
            # add version if we found something after the period
            $search_columns->{rep_accnum} = $accnum;
            $search_columns->{rep_version} = $version if( $version );

        }
        
        # Put the search terms back on the stack
        unshift @_, $search_columns;
    }

    # And call the SUPER
    return $self->SUPER::search( @_ );

}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

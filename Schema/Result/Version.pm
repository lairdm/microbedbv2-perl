use utf8;
package MicrobedbV2::Schema::Result::Version;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::Version

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<version>

=cut

__PACKAGE__->table("version");

=head1 ACCESSORS

=head2 version_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 dl_directory

  data_type: 'text'
  is_nullable: 1

=head2 version_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 used_by

  data_type: 'text'
  is_nullable: 1

=head2 is_current

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "version_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "dl_directory",
  { data_type => "text", is_nullable => 1 },
  "version_date",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "used_by",
  { data_type => "text", is_nullable => 1 },
  "is_current",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</version_id>

=back

=cut

__PACKAGE__->set_primary_key("version_id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jJRdvOS+YewAdgTOXEp/rw

__PACKAGE__->resultset_class('MicrobedbV2::Schema::Version::ResultSet');

package MicrobedbV2::Schema::Version::ResultSet;
use base 'DBIx::Class::ResultSet';

sub fetch_version {
    my ($self, $version) = @_;

    my $v;
    if($version eq 'current') {
        return $self->current();
    } elsif($version eq 'latest') {
        return $self->latest();
    } elsif($version =~ /\d+/) {
        $v = $self->search( {
            version_id => $version
                                     }
            )->first;
    }

    if($v) {
        return $v->version_id
    }
    return 0;

}

sub latest {
    my ($self) = @_;

    my $column = $self->get_column('version_id');
    return $column->max;
}

sub current {
    my ($self) = @_;

    my $v = $self->search( {
        is_current => 1
                        }
        )->first;

    if($v) {
        return $v->version_id
    }
    return 0;

    
}
# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

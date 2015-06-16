use utf8;
package MicrobedbV2::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tUedeycHRsLIfLGUU2YXjw

sub fetch_version {
    my ($self, $version) = @_;

    return $self->resultset('Version')->fetch_version($version);
}

sub latest {
    my ($self) = @_;

    return $self->resultset('Version')->latest();
}

sub current {
    my ($self) = @_;

    return $self->resultset('Version')->current();
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

package MicrobedbV2::Singleton;
use MooseX::Singleton;
use DBIx::Class;
use MicrobedbV2::Schema;

use strict;

has schema => (
    is      => 'ro',
    isa     => 'Ref',
    writer  => '_set_dbh'
);

has dsn => (
    is      => 'rw',
    isa     => 'Str'
);

# Initialize a MicrobeDB DBIx::Class connection,
# grab the authentication information from the
# environment if we aren't given it

sub initialize {
    my $self = shift;
    my $args = shift;

    my $schema;
    if(! $args->{dsn}) {
        my $db_config = "$ENV{HOME}/.my.cnf";
        my $database=$ENV{"MicrobeDBV2"}||$ENV{"MicrobeDB"}||"microbedb";  # if unable to access .bashrc, use microbedb
        my $dsn = "DBI:mysql:database=$database;mysql_read_default_file=$db_config;mysql_local_infile=1";
        $schema = MicrobedbV2::Schema->connect($dsn);

        $self->dsn($dsn);

    } else {
        $schema = MicrobedbV2::Schema->connect($args->{dsn},
                                               $args->{user},
                                               $args->{pass});

        $self->dsn($args->{dsn});
    }
    
    die "Error: Unable to connect to the database for $args->{dsn}" if ! $schema;

    $self->_set_dbh($schema);

    return $self;
}

# Fetch the schema instance, initialize if we
# haven't already initialized

sub fetch_schema {
    my $self = shift;

    if(! $self->schema) {
        $self->initialize();
    }

    return $self->schema;
}

1;

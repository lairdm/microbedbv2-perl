#!/usr/bin/env perl

use strict;
use lib "../";
use MicrobedbV2::Singleton;

#MicrobedbV2::Singleton->initialize({dsn=> 'DBI:mysql:database=microbedb_dev;host=localhost', user=> 'microbedb', pass=>'mdbpassword'});

my $schema = MicrobedbV2::Singleton->fetch_schema;

my $version_rs = $schema->resultset('Version')->search( {
    version_id => 1
                                                        }
    );

while ( my $version = $version_rs->next() ) {
    print $version->version_id . "\n";
    print $version->dl_directory . "\n";

}

print $schema->resultset('Version')->fetch_version(5) . "\n";
print $schema->resultset('Version')->fetch_version(1) . "\n";
print $schema->resultset('Version')->fetch_version('latest') . "\n";
print $schema->resultset('Version')->fetch_version('current') . "\n";
print $schema->resultset('Version')->fetch_version('a') . "\n";
print $schema->resultset('Version')->latest() . "\n";

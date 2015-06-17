use utf8;
package MicrobedbV2::Schema::Result::GenomeprojectMeta;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MicrobedbV2::Schema::Result::GenomeprojectMeta

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<genomeproject_meta>

=cut

__PACKAGE__->table("genomeproject_meta");

=head1 ACCESSORS

=head2 gpv_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 gram_stain

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["+","-","neither","unknown"]}
  is_nullable: 1

=head2 genome_gc

  data_type: 'float'
  default_value: 0.00
  is_nullable: 1
  size: [4,2]

=head2 patho_status

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["pathogen","nonpathogen","unknown"]}
  is_nullable: 1

=head2 disease

  data_type: 'text'
  is_nullable: 1

=head2 genome_size

  data_type: 'float'
  default_value: 0.00
  is_nullable: 1
  size: [4,2]

=head2 pathogenic_in

  data_type: 'text'
  is_nullable: 1

=head2 temp_range

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["unknown","cryophilic","psychrophilic","mesophilic","thermophilic","hyperthermophilic"]}
  is_nullable: 1

=head2 habitat

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["unknown","host-associated","aquatic","terrestrial","specialized","multiple'unknown","cryophilic","psychrophilic","mesophilic","thermophilic","hyperthermophilic"]}
  is_nullable: 1

=head2 shape

  data_type: 'text'
  is_nullable: 1

=head2 arrangement

  data_type: 'text'
  is_nullable: 1

=head2 endospore

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["yes","no","unknown"]}
  is_nullable: 1

=head2 motility

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["yes","no","unknown"]}
  is_nullable: 1

=head2 salinity

  data_type: 'text'
  is_nullable: 1

=head2 oxygen_req

  data_type: 'enum'
  default_value: 'unknown'
  extra: {list => ["unknown","aerobic","microaerophilic","facultative","anaerobic"]}
  is_nullable: 1

=head2 chromosome_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 plasmid_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 contig_num

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "gpv_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "gram_stain",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => { list => ["+", "-", "neither", "unknown"] },
    is_nullable => 1,
  },
  "genome_gc",
  {
    data_type => "float",
    default_value => "0.00",
    is_nullable => 1,
    size => [4, 2],
  },
  "patho_status",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => { list => ["pathogen", "nonpathogen", "unknown"] },
    is_nullable => 1,
  },
  "disease",
  { data_type => "text", is_nullable => 1 },
  "genome_size",
  {
    data_type => "float",
    default_value => "0.00",
    is_nullable => 1,
    size => [4, 2],
  },
  "pathogenic_in",
  { data_type => "text", is_nullable => 1 },
  "temp_range",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => {
      list => [
        "unknown",
        "cryophilic",
        "psychrophilic",
        "mesophilic",
        "thermophilic",
        "hyperthermophilic",
      ],
    },
    is_nullable => 1,
  },
  "habitat",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => {
      list => [
        "unknown",
        "host-associated",
        "aquatic",
        "terrestrial",
        "specialized",
        "multiple'unknown",
        "cryophilic",
        "psychrophilic",
        "mesophilic",
        "thermophilic",
        "hyperthermophilic",
      ],
    },
    is_nullable => 1,
  },
  "shape",
  { data_type => "text", is_nullable => 1 },
  "arrangement",
  { data_type => "text", is_nullable => 1 },
  "endospore",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => { list => ["yes", "no", "unknown"] },
    is_nullable => 1,
  },
  "motility",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => { list => ["yes", "no", "unknown"] },
    is_nullable => 1,
  },
  "salinity",
  { data_type => "text", is_nullable => 1 },
  "oxygen_req",
  {
    data_type => "enum",
    default_value => "unknown",
    extra => {
      list => [
        "unknown",
        "aerobic",
        "microaerophilic",
        "facultative",
        "anaerobic",
      ],
    },
    is_nullable => 1,
  },
  "chromosome_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "plasmid_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "contig_num",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</gpv_id>

=back

=cut

__PACKAGE__->set_primary_key("gpv_id");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2015-06-16 10:03:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aJT3sIEGpZVMI7+4IVvPvw

__PACKAGE__->belongs_to('genomeproject', 'MicrobedbV2::Schema::Result::Genomeproject', 'gpv_id');

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

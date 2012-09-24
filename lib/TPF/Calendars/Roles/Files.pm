package TPF::Calendars::Roles::Files;

use Moose::Role;
use Path::Class;
use File::Find::Rule;
use JSON;

sub data_from_json_files_in_dir {
    my ( $self, $dir ) = @_;

    my @json_files = File::Find::Rule->file()->name('*.json')->in($dir);

    my @files;
    foreach my $file (@json_files) {
        my $json = file($file)->slurp();

        # This goes BooM for malformed JSON
        my $data = decode_json($json);

        # If it's a list add the whole list, otherwise
        # assume it's a hash of data
        push @files, ref($data) eq 'ARRAY' ? @{$data} : $data;
    }
    return \@files;

}

1;

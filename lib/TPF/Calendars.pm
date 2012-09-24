package TPF::Calendars;

use Moose;

with 'TPF::Calendars::Roles::Download';
with 'TPF::Calendars::Roles::ICal';
with 'TPF::Calendars::Roles::Files';

sub run_external_feeds {
    my ( $self, $dir ) = @_;

    my $feed_data = $self->data_from_json_files_in_dir($dir);

    foreach my $feed ( @{$feed_data} ) {
        my $tmp_file = "/tmp/ical.ics";

        $self->download_file( $feed->{ical}, $tmp_file );

        my $ical = $self->ical_parse($tmp_file);


        foreach my $entry ( @{ $ical->entries } ) {

            my $event_data = $entry->properties;
            # Individual events
            # use Data::Dumper::Concise;
            # warn Dumper($event_data);
            
            my $summary = $event_data->{summary}->[0];
            
            print $event_data->{dtstart}->[0]->value . " - ";
            print $summary->value if $summary;
            print "\n";

        }
    }

}

1;

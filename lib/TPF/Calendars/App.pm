package TPF::Calendars::App;

use Moose;
with qw/MooseX::Getopt::Usage MooseX::Getopt::Usage::Role::Man/;

use TPF::Calendars;

=head1 NAME

  TPF::Calendars::Ap
  
=cut

#
# sub getopt_usage_config {
#     return ( usage_sections => ["SYNOPSIS|DESCRIPTION"] );
# }

sub run {

    my $kalel = TPF::Calendars->new();
    $kalel->run_external_feeds('config/external_feeds');

    #    die "Implement actually running the code";
}

sub add_event {
    die "Implement how to add an event";
}

sub add_feed {
    die "Implement how to add a feed";
}

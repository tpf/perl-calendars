package TPF::Calendars::Roles::ICal;

use Moose::Role;
use Data::ICal;

# Return Data::ICal obj?
sub ical_parse {
    my ($self, $file) = @_;
    
    return Data::ICal->new(filename => "$file");
}

sub ical_generate {
    die "FIXME: make work";
}

1;

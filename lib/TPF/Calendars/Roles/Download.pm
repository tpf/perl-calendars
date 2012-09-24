package TPF::Calendars::Roles::Download;

use Moose::Role;
use LWP::Simple;

sub download_file {
    my ( $self, $url, $file ) = @_;

    my $http_status = mirror( $url, "$file" );
    if ( is_redirect($http_status) ) {
        warn "URL now redirected do something! $url";
    }

    return is_success($http_status);
}

1;

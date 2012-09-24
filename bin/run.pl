#!/usr/bin/env perl
use strict;
use warnings;

use lib qw(lib);

use TPF::Calendars::App;

my $app = TPF::Calendars::App->new_with_options;

$app->run();


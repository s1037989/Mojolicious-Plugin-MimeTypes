use Mojo::Base -strict;

use Test::More;
use Mojolicious::Lite;
use Test::Mojo;

use MIME::Types;
use List::MoreUtils qw(uniq);

plugin 'MimeTypes';

my $t = app->types;
my $mts = MIME::Types->new;

foreach my $type ( $mts->listTypes ) {
  is_deeply $t->detect($type), [uniq sort map { lc($_) } $mts->type($type)->extensions],  "right formats: $type";
}

done_testing();

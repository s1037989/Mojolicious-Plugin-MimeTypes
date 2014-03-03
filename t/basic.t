use Mojo::Base -strict;

use Test::More;
use Mojolicious::Lite;
use Test::Mojo;

plugin 'MimeTypes';

get '/' => sub {
  my $self = shift;
  $self->render(text => 'Hello Mojo!');
};

my %sample = (
  mol => 'x-chemical/x-mdl-molfile',
  inp => 'x-chemical/x-gamess-input',
  s1g => 'image/vnd.sealedmedia.softseal.gif',
  spot => 'text/vnd.in3d.spot',
  sv4crc => 'application/x-sv4crc',
  jam => 'application/vnd.jam',
  mdb => 'application/x-msaccess',
  mar => 'text/plain',
  dxr => 'application/x-director',
);

get "/file" => [format => $_] => {text => $sample{$_}} foreach keys %sample;

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_is('Hello Mojo!');

$t->get_ok("/file.$_")->status_is(200)->content_type_is($sample{$_}) foreach keys %sample;

done_testing();

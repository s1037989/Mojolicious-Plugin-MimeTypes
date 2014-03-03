use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::MimeTypes',
  VERSION_FROM => 'lib/Mojolicious/Plugin/MimeTypes.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '4.86'},
  test         => {TESTS => 't/*.t'}
);

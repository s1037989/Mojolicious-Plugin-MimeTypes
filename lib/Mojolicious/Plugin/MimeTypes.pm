package Mojolicious::Plugin::MimeTypes;
use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

use MIME::Types;

sub register {
  my ($self, $app) = @_;
  my $mts = MIME::Types->new;
  foreach ( $mts->listTypes ) {
    my $mt = $mts->type($_);
    foreach ( $mt->extensions ) {
      $app->types->type($_ => $mt->type);
    }
  }
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::MimeTypes - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('MimeTypes');

  # Mojolicious::Lite
  plugin 'MimeTypes';

=head1 DESCRIPTION

L<Mojolicious::Plugin::MimeTypes> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::MimeTypes> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut

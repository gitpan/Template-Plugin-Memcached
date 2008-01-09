package Template::Plugin::Memcached;
use 5.008008;
use strict;
our $VERSION = '1.00';
use vars qw($AUTOLOAD);

use base ('Template::Base');
use Cache::Memcached::Fast;

sub load {
    my $class   = shift;
    my $context = shift;
    return $class;
}

sub new {
	my $class    = shift;
	my $context  = shift;
	my $param    = shift;
	my $memcached = new Cache::Memcached::Fast($param);
	my $self = {_CONTEXT => $context, Memcached=>$memcached};
	bless $self, $class;
}

sub AUTOLOAD {
	my $self = shift;
	my ($method) = $AUTOLOAD =~ /::([^:]+)$/;
	return $self->{'Memcached'}->$method(@_);
}

1;

__END__

=head1 NAME

Template::Plugin::Memcached - Cache::Memcached::Fast for Template Toolkit

=head1 SYNOPSIS

	[% USE Memcached(
		servers=>[{ address => 'localhost:11211', weight => 2.5 }, '192.168.254.2:11211', {address=>'/tmp/memcached.sock'}],
		namespace => 'my:',
		connect_timeout => 0.2,
		io_timeout => 0.5,
		close_on_error => 1,
		compress_threshold => 100_000,
		compress_ratio => 0.9,
		compress_algo => 'deflate',
		max_failures => 3,
		failure_timeout => 2,
		ketama_points => 150,
		nowait => 1
	)%]

	[% Memcached.get('keys') %]

=head1 DESCRIPTION

Cache::Memcached::Fast is a plugin for TT.

=head1 AUTHOR

Kostya Ten E<lt>kostya@bk.ruE<gt>

=head1 SEE ALSO

L<Template>

L<Cache::Memcached::Fast>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by Kostya Ten.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut




# ABSTRACT: Lucy interface for Dancer applications

use strict;
use warnings;
package Dancer::Plugin::Lucy;
use Dancer ':syntax';
use Dancer::Plugin;

use Lucy::Simple;

register indexer => sub {
    my $conf = plugin_setting();

    my $indexer = Lucy::Simple->new(
        index => $conf->{index},
        language => $conf->{polyanalyser}{language},
    );

    return $indexer;
};

register searcher => sub {
    my $conf = plugin_setting();
    my $searcher = Lucy::Simple->new(
        index => $conf->{index},
    );

    return $searcher;
};

register_plugin;

1;

__END__

=pod

=head1 NAME

Dancer::Plugin::Lucy - Lucy interface for Dancer applications

=head1 VERSION

version 0.003

=head1 AUTHOR

Emmanuel Di Pretoro <edipretoro@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Emmanuel Di Pretoro.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

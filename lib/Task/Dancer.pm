package Task::Dancer;

our $VERSION = '0.26';

1;

__END__

=head1 NAME

Task::Dancer - Dancer in a box

=head1 VERSION

Version 0.26

=head1 DESCRIPTION

This Task installs Dancer, optional engines, templates and assorted
modules that are not included in the Dancer core distribution.

If you've written anything relating to Dancer, please let us know.

We try to maintain a list of modules that are maintained and install
properly. If any of the modules C<Task::Dancer> tried to install
failing, warn us, so we can temporarily disable it. Also, tell us
if any module temporarily disabled is working again.

=head1 Template Engines

=head2 L<Dancer::Template::Alloy>

=head2 L<Dancer::Template::Ctpp2>

=head2 L<Dancer::Template::HAML>

=head2 L<Dancer::Template::HtmlTemplate>

=head2 L<Dancer::Template::Mason>

=head2 L<Dancer::Template::Mason2>

=head2 L<Dancer::Template::MicroTemplate>

=head2 L<Dancer::Template::MojoTemplate>

=head2 L<Dancer::Template::Semantic>

=head2 L<Dancer::Template::TemplateSandbox>

=head2 L<Dancer::Template::Tenjin>

=head2 L<Dancer::Template::Tiny>

=head2 L<Dancer::Template::Xslate>

=head1 Logging Engines

=head2 L<Dancer::Logger::ConsoleSpinner>

=head2 L<Dancer::Logger::Log4perl>

=head2 L<Dancer::Logger::LogHandler>

=head2 L<Dancer::Logger::Pipe>

=head2 L<Dancer::Logger::PSGI>

=head2 L<Dancer::Logger::Syslog>

=head1 Serialization

=head2 L<Dancer::Serializer::UUEncode>

=head1 Session Engines

=head2 L<Dancer::Session::Cookie>

=head2 L<Dancer::Session::KiokuDB>

=head2 L<Dancer::Session::Memcached>

=head2 L<Dancer::Session::PSGI>

=head2 L<Dancer::Session::Storable>

=head1 Plugins

=head2 L<Dancer::Plugin::Auth::RBAC>

=head2 L<Dancer::Plugin::Auth::Twitter>

=head2 L<Dancer::Plugin::Browser>

=head2 L<Dancer::Plugin::Cache>

=head2 L<Dancer::Plugin::Captcha::SecurityImage>

=head2 L<Dancer::Plugin::Database>

=head2 L<Dancer::Plugin::DBIC>

=head2 L<Dancer::Plugin::DebugDump>

=head2 L<Dancer::Plugin::Email>

=head2 L<Dancer::Plugin::Facebook>

=head2 L<Dancer::Plugin::Feed>

=head2 L<Dancer::Plugin::FlashMessage>

=head2 L<Dancer::Plugin::FlashNote>

=head2 L<Dancer::Plugin::FormattedOutput>

=head2 L<Dancer::Plugin::FormValidator>

=head2 L<Dancer::Plugin::GearmanXS> (temporarily disabled)

=head2 L<Dancer::Plugin::Memcached>

=head2 L<Dancer::Plugin::MemcachedFast>

=head2 L<Dancer::Plugin::MobileDevice> (temporarily disabled)

=head2 L<Dancer::Plugin::Mongo>

=head2 L<Dancer::Plugin::MPD>

=head2 L<Dancer::Plugin::ORMesque> (temporarily disabled)

=head2 L<Dancer::Plugin::Params::Normalization>

=head2 L<Dancer::Plugin::Progress>

=head2 L<Dancer::Plugin::ProxyPath>

=head2 L<Dancer::Plugin::Redis>

=head2 L<Dancer::Plugin::REST> (temporarily disabled)

=head2 L<Dancer::Plugin::Scoped> (temporarily disabled)

=head2 L<Dancer::Plugin::SimpleCRUD>

=head2 L<Dancer::Plugin::SiteMap>

=head2 L<Dancer::Plugin::SMS>

=head2 L<Dancer::Plugin::SporeDefinitionControl>

=head2 L<Dancer::Plugin::Validation> (temporarily disabled)

=head2 L<Dancer::Plugin::ValidationClass>

=head2 L<Dancer::Plugin::WebSocket>

=head1 More Plack middlewares

=head2 L<Dancer::Middleware::Reabase>

=head2 L<Dancer::Debug>

=head1 AUTHOR

Sawyer X, C<< <xsawyerx at cpan.org> >>

Alberto Simoes, C<< <ambs at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-task-dancer at rt.cpan.org>,
or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Task-Dancer>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I
make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Task::Dancer

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Task-Dancer>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Task-Dancer>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Task-Dancer>

=item * Search CPAN

L<http://search.cpan.org/dist/Task-Dancer/>

=back

=head1 ACKNOWLEDGEMENTS

L<Dancer> team.

=head1 LICENSE AND COPYRIGHT

Copyright 2010-2011 Sawyer X.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Task::Dancer',
    license             => 'perl',
    dist_author         => q{Sawyer X <xsawyerx@cpan.org>},
    dist_version_from   => 'lib/Task/Dancer.pm',
    build_requires => {
        'Test::More' => 0,
    },

    requires => {
        'perl' => 5.006,
    },

    auto_features => {
        template_tiny => {
            description => 'Template::Tiny templating support',
            requires    => { 'Dancer::Template::Tiny' => 0 },
        },

        template_tenjin => {
            description => 'Tenjin templating support',
            requires    => {
                'Dancer::Template::Tenjin' => 0,
                'Tenjin'                   => 0.5,
            },
        },

        template_haml => {
            description => 'Text::HAML templating support',
            requires    => { 'Dancer::Template::HAML' => 0 },
        },

        template_microtemplate => {
            description => 'Text::MicroTemplate templating support',
            requires    => { 'Dancer::Template::MicroTemplate' => 0 },
        },

        logging_syslog => {
            description => 'Sys::Syslog logging support',
            requires    => { 'Dancer::Logger::Syslog' => 0 },
        },

        logging_loghandler => {
            description => 'Log::Handler logging support',
            requires    => { 'Dancer::Logger::LogHandler' => 0 },
        },

        session_memcache => {
            description => 'Cache::Memcached session support',
            requires    => { 'Dancer::Session::Memcache' => 0 },
        },

        session_cookie => {
            description => 'Encrypted cookie-based session support',
            requires    => { 'Dancer::Session::Cookie' => 0 },
        },

        session_storable => {
            description => 'Storable file-based session support',
            requires    => { 'Dancer::Session::Storable' => 0 },
        },
    },

    add_to_cleanup      => [ 'Task-Dancer-*' ],
);

$builder->create_build_script();

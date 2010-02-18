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

    recommends => {
        'Tenjin'                          => 0.5,
        'Dancer::Template::Tenjin'        => 0,
        'Dancer::Template::Tiny'          => 0,
        'Dancer::Template::HAML'          => 0,
        'Dancer::Template::MicroTemplate' => 0,
        'Dancer::Logger::Syslog'          => 0,
        'Dancer::Logger::LogHandler'      => 0,
        'Dancer::Session::Memcache'       => 0,
        'Dancer::Session::Cookie'         => 0,
        'Dancer::Session::Storable'       => 0,
    },

    add_to_cleanup      => [ 'Task-Dancer-*' ],
);

$builder->create_build_script();

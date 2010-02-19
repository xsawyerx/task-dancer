use strict;
use warnings;

# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

name     'Task-Dancer';
all_from 'lib/Task/Dancer.pm';
license  'perl';
requires 'perl' => 5.006;

feature 'Template::Tiny templating support',
    -default                          => 0,
    'Dancer::Template::Tiny'          => 0;

feature 'Tenjin templating support',
    -default                          => 0,
    'Dancer::Template::Tenjin'        => 0,
    'Tenjin'                          => 0.5;

feature 'Text::HAML templating support',
    -default                          => 0,
    'Dancer::Template::HAML'          => 0;

feature 'Text::MicroTemplate templating support',
    -default                          => 0,
    'Dancer::Template::MicroTemplate' => 0;

feature 'Sys::Syslog logging support',
    -default                          => 0,
    'Dancer::Logger::Syslog'          => 0;

feature 'Log::Handler logging support',
    -default                          => 0,
    'Dancer::Logger::LogHandler'      => 0;

feature 'Cache::Memcached session support',
    -default                          => 0,
    'Dancer::Session::Memcache'       => 0;

feature 'Encrypted cookie-based session support',
    -default                          => 0,
    'Dancer::Session::Cookie'         => 0;

feature 'Storable file-based session support',
    -default                          => 0,
    'Dancer::Session::Storable'       => 0;

auto_install;
WriteAll;

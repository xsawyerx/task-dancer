use strict;
use warnings;

# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

my %features = (
    templating => {
        namespace       => 'Template',
        Tiny            => { name => 'Template::Tiny', min => '0.02' },
        HtmlTemplate    => { name => 'HTML::Template', min => '0.02' },

        Alloy           => { name => 'Alloy'               },
        Tenjin          => { name => 'Tenjin'              },
        Haml            => { name => 'Text::HAML'          },
        Mason           => { name => 'HTML::Mason'         },
        MicroTemplate   => { name => 'Text::MicroTemplate' },
        TemplateSandbox => { name => 'Template::Sandbox'   },
    },

    logging => {
        namespace  => 'Logger',
        Syslog     => { name => 'Sys::Syslog'      },
        LogHandler => { name => 'Log::Handler'     },
    },

    session => {
        namespace => 'Session',
        Memcache  => { name => 'Cache::Memcached' },
        Cookie    => { name => 'Encrypted cookie-based' },
        Storable  => { name => 'Storable file-based'    },
    },

    plugin => {
        namespace  => 'Plugin',
        Database   => { name => 'Database'                 },
        SiteMap    => { name => 'Site map creation'        },
        REST       => { name => 'RESTful apps'             },
        Email      => { name => 'Email::Stuff integration' },
        Validation => { name => 'Oogly Data validation'    },
    },
);

name     'Task-Dancer';
all_from 'lib/Task/Dancer.pm';
license  'perl';
include  'Module::AutoInstall';
requires 'Dancer' => 0;

foreach my $type ( keys %features ) {
    my $namespace = delete $features{$type}{'namespace'};

    foreach my $semi_namespace ( keys %{ $features{$type} } ) {
        my $full_namespace = "Dancer::${namespace}::${semi_namespace}";
        my ( $name, $default, $min ) =
            @{ $features{$type}{$semi_namespace} }{qw/ name default min /};

        $default ||= 0;
        $min     ||= 0;

        feature "$name $type support",
            -default => $default, $full_namespace => $min;
    }
}

auto_install;
WriteAll;


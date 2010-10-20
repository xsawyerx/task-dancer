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
        Ctpp2           => { name => 'HTML::CTPP2'         },
    },

    logging => {
        namespace  => 'Logger',
        LogHandler => { name => 'Log::Handler' },
        PSGI       => { name => 'PSGI'         },
        Syslog     => { name => 'Sys::Syslog'  },
    },

    session => {
        namespace => 'Session',
        Cookie    => { name => 'Encrypted cookie-based'     },
        Memcache  => { name => 'Cache::Memcached'           },
        PSGI      => { name => 'Plack::Middleware::Session' },
        Storable  => { name => 'Storable file-based'        },
    },

    plugin => {
        namespace  => 'Plugin',
        Authorize  => { name => 'Authentication'              },
        Database   => { name => 'Database'                    },
        DBIC       => { name => 'DBIx::Class interface'       },
        SiteMap    => { name => 'Site map creation'           },
        REST       => { name => 'RESTful apps'                },
        Email      => { name => 'Email::Stuff integration'    },
        Validation => { name => 'Oogly Data validation'       },
        Scope      => { name => 'parameter variables scoping' },

        'Params::Normalization' => { name => 'query param normalization' },
    },

    # for now it's middlewares
    middleware => {
        'Debug' => { name => 'Plack::Middleware::Debug' },
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
        my $full_namespace = $namespace                               ?
                            "Dancer::${namespace}::${semi_namespace}" :
                            "Dancer::${semi_namespace}";

        my ( $name, $default, $min ) =
            @{ $features{$type}{$semi_namespace} }{qw/ name default min /};

        $default ||= 1; # install by default unless otherwise specified
        $min     ||= 0; # no minimum version by default

        feature "$name $type support",
            -default => $default, $full_namespace => $min;
    }
}

auto_install;
WriteAll;


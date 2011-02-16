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
        LogHandler => { name => 'Log::Handler' },
        PSGI       => { name => 'PSGI'         },
        Syslog     => { name => 'Sys::Syslog'  },
    },

    session => {
        namespace => 'Session',
        Cookie    => { name => 'Encrypted cookie-based'     },
        Memcached => { name => 'Cache::Memcached'           },
        PSGI      => { name => 'Plack::Middleware::Session' },
        Storable  => { name => 'Storable file-based'        },
    },

    plugin => {
        namespace    => 'Plugin',

        Authorize    => { name => 'Authentication'              },
        Browser      => { name => 'Browser detection'           },
        Database     => { name => 'Database'                    },
        DataFu       => { name => 'Generate HTML tables/forms'  },
        DBIC         => { name => 'DBIx::Class interface'       },
        Email        => { name => 'Email::Stuff integration'    },
        Feed         => { name => 'Generate feed rss or atom'   },
        FlashMessage => { name => 'Display temporary messages'  },
        FlashNote    => { name => 'Notification messages'       },
        FormValidator => { name => 'Easy input validator'       },
        Memcached    => { name => 'Cache response content'      },
        # MobileDevice => { name => 'Dancer app mobile-aware'     }, => failing 0.02
        Mongo        => { name => 'MongoDB'                     },
        MPD          => { name => 'Easy connection to MPD'      },
        # ORMesque   => { name => 'Light ORM'                   }, => failing 1.103180
        'Params::Normalization' => { name => 'query param normalization' },
        Redis        => { name => 'Redis database connections'  },
        # REST       => { name => 'RESTful apps'                }, => failing 0.04
        # Scoped     => { name => 'parameter variables scoping' }, => failing 0.01
        SimpleCRUD   => { name => 'very simple CRUD'            },
        SiteMap      => { name => 'Site map creation'           },
        SMS          => { name => 'Easy SMS sending'            },
        # SporeDefinitionControl => { name => 'Validite route from a Spore' }, => depends on REST
        # Validation => { name => 'Oogly Data validation'       }, => not available on CPAN?
        ValidationClass => { name => 'Centralized Input Validation' },
        WebSocket    => { name => 'Easily create WebSocket apps' },
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


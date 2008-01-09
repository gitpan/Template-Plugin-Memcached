use 5.008008;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Template::Plugin::Memcached',
    VERSION_FROM      => 'lib/Template/Plugin/Memcached.pm',
    PREREQ_PM         => { 'Template' => 0, 'Cache::Memcached::Fast' => 0},
    ($] >= 5.005 ?
    (ABSTRACT_FROM  => 'lib/Template/Plugin/Memcached.pm', AUTHOR=> 'ndix <kostya@bk.ru>') : ()),
);



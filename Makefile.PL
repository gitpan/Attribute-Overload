use inc::Module::Install;
name 'Attribute-Overload';
all_from 'lib/Attribute/Overload.pm';
perl_version '5.006';

build_requires 'Test::More' => '0.70';

use_standard_tests;
auto_include;
WriteAll;

use inc::Module::Install;
name 'Attribute-Overload';
all_from 'lib/Attribute/Overload.pm';

build_requires 'Test::More';

use_test_base;
auto_include;
WriteAll;

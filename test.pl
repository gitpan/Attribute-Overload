# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Attribute::Overload;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

package MyOverload;

sub new {
	my ($class, $value) = @_;
	bless \$value => $class;
}

sub add : Overload(+) { 
	my ($self, $value) = @_;
	$$self += 2 * $value;
	return $self;
}

sub cmpnum : Overload(==) {
	my $self = shift;
	$$self;
}

# double each digit
sub to_print : Overload("") { join '' => map { "$_$_" } split // => ${$_[0]} }

package main;

my $o = MyOverload->new(57);
print 'not ' unless $o == 57;
print "ok 2\n";

$o += 23;  # adds 46 to give 103
print 'not ' unless $o == 103;
print "ok 3\n";

# stringify prints each digit twice, i.e. '110033'
print 'not ' unless "$o" eq '110033';
print "ok 4\n";


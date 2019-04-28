use warnings;
use strict;
use Tie::Hash::Indexed;

tie my %hash, 'Tie::Hash::Indexed';
%hash = (A => 1,B => 2,C => 3,D => 4,E => 5, F => 6, G => 7, H => 8, I => 9,J => 10,K => 11,L => 12, M => 13,N => 14,O => 15,P => 16,Q => 17,R => 18,S => 19,T => 20,U => 21,V => 22,W => 23,X => 24,Y => 25,Z => 26," " => 27);

my @inAr;
@inAr = getInput();
my @convArr; 
@convArr = encryptInput(@inAr);
writeFile(@convArr);
print("Encrypted: @convArr\n");
print "Decrypted: ";
print &decryptString(&readFile);

sub getInput
{
	print("Prompt>>");
	chomp(my $inp=<STDIN>);
	my @iArr = split("",$inp);
	return @iArr;
}

sub encryptInput
{
	my @convArr = [];
	foreach (@_)
	{
		print("Letter: $_ = ");
		foreach my $key (keys %hash)
		{
			if ($_ =~ /$key/i)
			{
				print("$hash{$key}\n");
				push(@convArr,($hash{$key}*50)/100);
			}
		}
	}
	shift(@convArr);
	return @convArr;
}

sub decryptString
{
	my (@tmp);
	foreach my $val (@_)
	{
		$val = ($val*100)/50;
		foreach my $key(keys %hash)
		{
			if( $val == $hash{$key})
			{
				push(@tmp, $key);
			}
		}
	}
	return @tmp;
}

sub readFile
{
	open (ENCFILE, "<C:\\Users\\765052\\Documents\\ENCRYPTEDSTRING");
	my @inArray = split(" ",<ENCFILE>);
	close(ENCFILE);
	return @inArray;
}


sub writeFile
{
	open (ENCFILE, ">C:\\Users\\765052\\Documents\\ENCRYPTEDSTRING");
	foreach (@_)
	{
		print ENCFILE ("$_ ");
	}
	close(ENCFILE);
}	
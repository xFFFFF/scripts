use JSON::XS;
use TOML;
use Data::Dumper;
use strict;

# Example filter
# system("sort foo.csv | uniq -c | sed -e "s/\s\+ [0-9]* //g" | grep -E "([A-Z]{2,5})(, )([0-9.]+)(, )([1-6][0-9], )" | sed -e "s/[0-9.]*, [0-9][0-9]//g" | sort | uniq -c | sort -h | sed -e "s/\s\+[0-9][0-9]* //g"  | sed "s/^\w\+, //g" | sort | uniq -c | sort | grep -E "\s+[4-9] " | sed "s/\s\+[0-9] //g">> configs.txt");

sub convert_json_toml {
  my $toml;
  if (defined $_[0]) {
  	my $coder = JSON::XS->new->ascii->pretty->allow_nonref;
  	my $json = $coder->decode ($_[0]);
  	$toml = to_toml($json);
  }
  else {
    $toml = 'N/A';
  }
  return $toml;
}

open my $fh, 'configs.txt' or die "Could not open$!";
my $counter = sprintf("%03d", 1);
while( my $line = <$fh>)  {   
	$line =~ s/'/"/g;
	print "NNv2_$counter - ";
    print $line;    
    my $tomlfile = convert_json_toml($line); 
    open my $fh2, '>', 'NNv2_'.$counter.'.toml' or die "Could not open: $!";
    print $fh2 join ("\n",$tomlfile); 
    close $fh2;
    ++$counter;
}
close $fh;
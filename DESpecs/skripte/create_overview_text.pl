#!/usr/bin/perl -w
use strict;
use warnings;

#
# create_overview_text2.pl
#
# Wolfgang Schmidle, 2008-10-06
#


my @datei;

while (<>)
{
	push @datei, $_;
}


# Bestimme die neuen Dateinamen:
# Aus "dateiname.tex" wird "dateiname_overview.tex".
# Wenn der alte Dateiname nicht auf ".tex" endet, wird einfach "_neu.tex" angehängt.

$_ = $ARGV;
/^(.+?)(\.TEX|\.tex)?$/;
my $neuerDateiname = "$1_overview.tex";


my @neueDatei;

my $sollweg = 0;
my $leerzeile = 0;

my $unwichtig = ' mainruleLessImportant clarification note ';
$unwichtig .= ' example exampleTest sampleImage smallSampleImage ';
$unwichtig .= ' crossref exception ';
$unwichtig .= ' tabelle liste ';

foreach (@datei)
{
	next if (/^%/ && !(/%!TEX/)); # remove comment lines, keep the header lines,
	s/\.tex/_overview.tex/;       # but add _overview to the reference
	
	next if /^\\vspace/;
	next if /^\\tocspace/;
	next if /^\\clearpage/;
	next if /^\\mehrzeilen/;

	s/^%overview //;    # commands for the overview document 
						# that are ignored in the main document

	# remove all unwanted enviromnents, e.g. clarification
	if (/\\begin\{(.+?)\}/)
	{
		if ($unwichtig =~ / $1 /) { $sollweg = 1; }
	}		
	unless ($sollweg)
	{
		if (/^ *$/) { $leerzeile++; } else { $leerzeile = 0; }
		push @neueDatei, $_ unless $leerzeile > 1;
	}
	if (/\\end\{(.+?)\}/)
	{
		if ($unwichtig =~ / $1 /) { $sollweg = 0; }
	}
}

for my $i (0..$#neueDatei-2)
{
	my $offset = 2;
	$_ = $neueDatei[$i+1];
	if (/\\label/) { $offset++; }
	
	$_ = $neueDatei[$i];
	if (/\\section/)
	{
		$_ = $neueDatei[$i+$offset];
		if (/^ *$/ || /\\section/)
		{
#			$neueDatei[$i] =~ s/\{(.+?)\}/\{($1)\}/;
			$neueDatei[$i] = "% $neueDatei[$i]";
			$neueDatei[$i] .= '\refstepcounter{section}';
			$neueDatei[$i] .= "\n";	
		}
	} 
	else 
	{
		if (/\\subsection/)
		{
			$_ = $neueDatei[$i+$offset];
			if (/^ *$/ || /\\section/ || /\\subsection/)
			{
#				$neueDatei[$i] =~ s/\{(.+?)\}/\{($1)\}/;
				$neueDatei[$i] = "% $neueDatei[$i]";
				$neueDatei[$i] .= '\refstepcounter{subsection}';
				$neueDatei[$i] .= "\n";	
			}
		} 
		else 
		{
			if (/\\subsubsection/)
			{
				$_ = $neueDatei[$i+$offset];
				if (/^ *$/ || /\\section/ || /\\subsection/ || /\\subsubsection/)
				{
#					$neueDatei[$i] =~ s/\{(.+?)\}/\{($1)\}/;
				$neueDatei[$i] = "% $neueDatei[$i]";
				$neueDatei[$i] .= '\refstepcounter{subsubsection}';
				$neueDatei[$i] .= "\n";	
				}
			}
		}
	}
}

# Schreibe das Ergebnis in die Datei $neuerDateiname im gleichen Verzeichnis wie die alte Datei. 
# Eine bereits vorhandene Datei mit gleichem Namen wird ohne Warnung überschrieben.

open (NEUEDATEI, ">$neuerDateiname");
print NEUEDATEI @neueDatei;
close (NEUEDATEI);

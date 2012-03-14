#!/usr/bin/perl -w

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->agent_alias ('Windows Mozilla');
$mech->get ("http://www.deredactie.be/cm/vrtnieuws/mediatheek/programmas/journaal?view=shortcutDepartment&shortcutView=defaultList");

$mech->follow_link ( text_regex => qr/integraal/i );
if ($mech->content() =~ m"(http\S+flv)") { 
print "Match!\n";
print $1,"\n";
$date = `date +%Y-%m-%d`;
chomp($date);
$mech->get ($1, ':content_file' => "downloads/$date-journaal.flv");
}

#!/usr/bin/perl -w

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->agent_alias ('Windows Mozilla');
$mech->get ("http://www.deredactie.be/cm/vrtnieuws/mediatheek/programmas/panorama?view=shortcutDepartment&shortcutView=defaultList");

$mech->follow_link ( text_regex => qr/meneer/i );
if ($mech->content() =~ m"(http\S+flv)") { 
print "Match!\n";
print $1,"\n";
$mech->get ($1, ':content_file' => "downloads/panorama-vrouwenhandel.flv");
}

#!/usr/bin/perl -w

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->agent_alias ('Windows Mozilla');
$mech->get ("http://www.deredactie.be/cm/vrtnieuws/mediatheek/programmas/koppen/2.10208/2.10209/1.765201?view=shortcutArticle&shortcutView=popupPlayer");

$mech->follow_link ( text_regex => qr/verfranst/i );
if ($mech->content() =~ m"(http\S+flv)") { 
print "Match!\n";
print $1,"\n";
$mech->get ($1, ':content_file' => "downloads/koppen-verfranst.flv");
}

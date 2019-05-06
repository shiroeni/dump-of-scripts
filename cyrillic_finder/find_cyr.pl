#!/usr/local/bin/perl
use File::Find;
use locale;
use utf8;

my $target_dir = "/path/to/dir";
chomp $target_dir;

my $dir;
my @files;
my $file_path;

find(\&wanted, $target_dir);

foreach $file_path (@files) {
  my $content;

  $content = do {
    local $/ = undef;
    open my $fc, "<:encoding(UTF-8)", $file_path
        or die "Can't open file :(";
    <$fc>;
  };

  if ($content =~ m/[а-яА-Я]+/i) {
    print "\e[91m$file_path \n";
  }
};

exit;

sub wanted {
  push @files, $File::Find::name;
  return;
};

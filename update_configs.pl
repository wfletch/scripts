#!/usr/bin/perl
use v5.10;
use warnings;
use strict;
# WIP: The idea here is to update all my config repositories automatically everyday 
# Ok, what are we doing.
# 1. Copy Over Configs to the config repo
 
say "Switching Directories to: ", "$ENV{'BACKUP_CONFIG_DIR'}";
chdir "$ENV{'BACKUP_CONFIG_DIR'}";
say "Copying Configs";
my $output = `./get_configs.sh`;
say "Updating Configs";
`git add *`;
my $date_string = localtime();
`git commit -m "Auto Update: $date_string"`;
`git pull --rebase`;
`git push`;
say "All Done";
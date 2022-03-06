#!/usr/bin/perl
use v5.10;
use warnings;
use strict;
use POSIX qw(strftime);
# WIP: The idea here is to update all my config repositories automatically everyday 
# Ok, what are we doing.
# 1. Copy Over Configs to the config repo and push
 
say "Switching Directories to: ", "$ENV{'BACKUP_CONFIG_DIR'}";
chdir "$ENV{'BACKUP_CONFIG_DIR'}";
my $date = strftime "%m_%d_%Y", localtime;
say "Copying Configs";
my $output = `./get_configs.sh`;
say "Updating Configs: $date";
`echo $date >> date_entry`;
`git add *`;
`git commit -m "Auto Update: $date"`;
`git pull --rebase`;
`git push`;
say "All Done";
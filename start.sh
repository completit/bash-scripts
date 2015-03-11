#!/bin/bash
APP="cd $HOME/Projects/application/"
SDI="cd $HOME/Projects/stream-dispatcher/"
MWC="cd $HOME/Projects/mwd-comm"
MKD="cd $HOME/Projects/market-data"
DRT="cd $HOME/Projects/data-retention"
GME="cd $HOME/Projects/game"
REN="cd $HOME/Projects/resolve"

whiptail --title "Launch Devel Servers Environment" --msgbox "We're ready to rock the party sir. Choose Ok if your ready." 10 60
eval $APP
bash -cl "bundle exec rake daemons:start"
bash -cl "bundle exec script/server thin"
{
    for ((i = 0 ; i <= 100 ; i+=30)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Starting daemons & thin server chief!" 6 60 0
eval "cd"

eval $SDI
bash -cl 

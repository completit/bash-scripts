#!/bin/bash
APP="cd $HOME/Projects/application/"
SDI="cd $HOME/Projects/stream-dispatcher/"
MWC="cd $HOME/Projects/mwd-comm"
MKD="cd $HOME/Projects/market-data"
DRT="cd $HOME/Projects/data-retention"
GME="cd $HOME/Projects/game"
REN="cd $HOME/Projects/resolve"
EXP="cd $HOME/Projects/expiry"
WDG="cd $HOME/Projects/watchdog"

# launching script/server thin
whiptail --title "Launch Devel Servers Environment" --msgbox "We're ready to rock the party sir. Choose Ok if your ready." 10 60
eval $APP
screen -dmS rails-server bash -cl "bundle exec script/server thin"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Starting daemons & thin server chief!" 6 60 0
eval "cd"

# launching stream-dispatcher
eval $SDI
screen -dmS stream-dispatcheri bash -cl "./install.sh"
screen -dmS stream-dispatcherns bash -cl "node server.js"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "We're just starting stream-dispatcher!" 6 60 0
eval "cd"

# launching mwd-comm
eval $MWC
screen -dmS mwd-commi bash -cl "./install.sh"
screen -dmS mwd-commna bash -cl "node app.js"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "We're fuckin starting mwd-comm!" 6 60 0
eval "cd"

# launching market-data
eval $MKD
bash -cl "bundle"
screen -dmS market-data-engine bash -cl "bundle exec bin/market-data"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Dude! Starting market-data!" 6 60 0
eval "cd"

# launching data-retention
eval $DRT
bash -cl "bundle"
screen -dmS data-retention-engine bash -cl "bundle exec bin/data-retention"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Okay! Now starting data-retention!" 6 60 0
eval "cd"

# launching game-engine
eval $GME
bash -cl "bundle"
screen -dmS game-engine bash -cl "bundle exec bin/game"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Starting game-engine. DNFD!!" 6 60 0
eval "cd"

# launching resolve
eval $REN
bash -cl "bundle"
screen -dmS resolve-engine bash -cl "bundle exec bin/resolve"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Almost there...Starting resolve-engine." 6 60 0
eval "cd"

# launching expiry
eval $EXP
bash -cl "bundle"
screen -dmS expiry-engine bash -cl "bundle exec bin/expiry"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Starting expiry-engine!!" 6 60 0
eval "cd"

# launching watchdog
eval $WDG
bash -cl "bundle"
screen -dmS watchdog bash -cl "bundle exec bin/watchdog"
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Finally... starting watchdog!!" 6 60 0

whiptail --title "Server Initiation Sequence completed!!" --msgbox "Server starting completed. Choose Ok to finish." 10 60

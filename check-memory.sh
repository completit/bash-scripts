#!/bin/bash
OPTION=$(whiptail --title "Test Menu Dialog" --menu "Choose your option" 15 60 4 \
"1" "Show Memory Pie Proportional set size (PSS)" \
"2" "Show Memory Bar with PSS and Unique set size (USS)" \
"3" "Just show me in Konsole the detailed processes!" 3>&1 1>&2 2>&3)
 
# exitstatus=$?
if [ $OPTION = 1 ]; then
  echo $(smem --pie name -c "pss")
elif [[ $OPTION = 2 ]]; then
	echo $(smem --bar name -c "pss uss" -U tibi)
elif [[ $OPTION = 3 ]]; then
	eval "htop"
else
  echo "You chose Cancel. Buh bye!"
fi

#!/usr/bin/env bash

clear

echo "Select option ->"
echo -e "\n"
#---VPN
echo "1-VPN"
echo "2-Without VPN"
printf "\n"
read -p ">>> " vp

if [[ $vp == "1" ]]; then
  clear
  echo "---------"
  printf "\n"
  echo "Enter Passworld ->"
  printf "\n"
  cd nipe/
  sudo perl nipe.pl start
  sudo perl nipe.pl restart
  sudo perl nipe.pl restart
  sudo perl nipe.pl status
  echo -e "\n"
  echo "Changing IP!"
  sleep 3
  clear
else
  clear

fi

#---SET TIME

echo "1-Set Time!"
echo "2-Now!"
printf "\n"
read -p ">>> " tn

if [[ $tn == "1" ]]; then
  echo -e "\n"

  read -p "Link: " lnk
  printf "\n"
  read -p "Hour: " hour
  read -p "Minuts: " minut
  printf "\n"

  #--- Sigma Date ---
  H=`date +%H`
  M=`date +%M`
  date=$(($H * 60 + $M))
  date_input=$(($hour * 60 + $minut))

  while [[ $date != $date_input ]]; do
    sleep 20
    H=`date +%H`
    M=`date +%M`
    date=$(($H * 60 + $M))
  done

  notify-send "Downloading..."
  sudo perl nipe.pl stop && cd ..
  mkdir Download
  cd Download
  wget $lnk
  notify-send "Downloaded!"
  echo -e "\n"
  echo "Done!"
  printf "\n"
  echo "Created file Download"
  printf "\n"
  echo "CD to Download"

#--- ELIF

elif [[ $tn == "2" ]]; then
  echo -e "\n"
  read -p "Link: " lnk

  notify-send "Downloading..."
  sudo perl nipe.pl stop && cd ..
  mkdir Download
  cd Download
  wget $lnk
  notify-send "Downloaded!"
  echo -e "\n"
  echo "Done!"
  printf "\n"
  echo "Created file Download"
  printf "\n"
  echo "CD to Download"

fi


#!/bin/bash
sudo apt -y update;
sudo apt -y upgrade;
sudo apt -y install chromium-browser;

crontab -l > mycron
printf "*/20 * * * * /home/$1/startMonitor &\n" >> mycron
printf "15 3 * * * /usr/sbin/reboot &\n" >> mycron
crontab mycron
rm mycron

##compatibel nur mit bullseyes
xset s off
xset s noblank
xset -dpms

##start monitor
touch startMonitor
chmod 755 startMonitor
printf "#!/bin/bash\n" >> startMonitor
printf "export DISPLAY=:0;\n" >> startMonitor
printf "xset s off" >> startMonitor
printf "xset s noblank" >> startMonitor
printf "xset -dpms" >> startMonitor
printf "killall chromium-browser;\n" >> startMonitor
printf "sleep 2;\n" >> startMonitor
printf "chromium-browser -kiosk -private-window $2;\n" >> startMonitor



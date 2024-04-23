#!/bin/bash
sudo apt -y update;
sudo apt -y upgrade;
sudo apt -y install chromium-browser;

crontab -l > mycron
printf "*/20 * * * * /home/$2/startMonitor &\n" >> mycron
printf "15 3 * * * /usr/sbin/reboot &\n" >> mycron

##start monitor
touch startMonitor
chmod 755 startMonitor
printf "#!/bin/bash\n" >> startMonitor
printf "export DISPLAY=:0;\n" >> startMonitor
printf "killall chromium-browser;\n" >> startMonitor
printf "sleep 2;;\n" >> startMonitor
printf "chromium-browser -kiosk -private-window $1;\n" >> startMonitor



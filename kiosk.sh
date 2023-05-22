#!/bin/bash
xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/$USER/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/$USER/.config/chromium/Default/Preferences

chromium --noerrdialogs --disable-infobars --kiosk https://$URL-OF-YOUR-SYSTEM
# Mine is behind NPM on my local network, it has a FQDN and SSL for  access. 
# The url is directly to the protect subpage of the view I want to access. not just the main protect page. 

sleep 20

# The following section is for if you need to login on ever reboot.
xdotool type '$UNIFI-USERNAME'
sleep 1
xdotool key Tab; sleep 1
sleep 2
xdotool type '$UNIFI-PASSWORD'
# plaintext password, shoot me.... I'm sure it could be done better, but this is on my local network, has a limited unifi user with view only and for now it is what I am rolling with. 
sleep 2
xdotool key Return; sleep 2

# The following auto refreshes the page every so many seconds
while true; do
   xdotool keydown ctrl+r; xdotool keyup ctrl+r;
   sleep 10000
done





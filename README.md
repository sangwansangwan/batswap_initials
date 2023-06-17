
# BATSWAP INITIALS


## Authors

- [@sangwansangwan](https://github.com/sangwansangwan)


## Prerequisite installations:-

1. ) First make sure to install **chromium browser**, incase its not installed. Install chromium with following command .

```bash
  sudo apt-get install chromium -y
```

> **_NOTE:_**  In some cases, the browser name might be chromium-browser, so try with (sudo apt-get install chromium-browser -y).

2. ) Installation of tool needed for browser synching, named xdotool .

```bash
  sudo apt install xdotool

```

..............................................................................................................................................................

## Files placements and tweaks :-

1. ) You have three files named, **swapPre.sh** , **swapMain.sh** and **stationRpi** . Place them in some safe folder accordingly.
2. ) After placements of both file in folder, run this command to make it executable.
```bash
  chmod +x swapPre.sh && chmod +x swapMain.sh

```
3. ) After this, open **swapPre.sh** in editor mode :- 
```bash
  sudo nano swapPre.sh
```
4. ) Now edit 19th line where **cron_command** is placed, provide full/absolute path of **swapMain.sh**, for example : 
```bash
  cron_command="/home/XYZ/Desktop/SwappingPackages/swapMain.sh"
```
5. ) Now check whether chromium browser process name is ***chromium*** or ***chromium-browser***. It can be done with tapping TAB button after typing chromium in terminal.
6. ) If in case the browser name is chromium-browser swap 6th line with bottom one where string="@chromium-browser --kiosk http://batswap.electrifuel.com:3000" is mentioned. It should look like this.
```bash
# string="@chromium --kiosk http://batswap.electrifuel.com:3000"
string="@chromium-browser --kiosk http://batswap.electrifuel.com:3000"
```
7. ) Now, edit **swapMain.sh** as well provide the absolute path for stationRpi and proper station ID, organisation ID and rack ID in 16th line.  

..............................................................................................................................................................
## Executions and checks :-

1. ) Now run command .
```bash
  ./swapPre.sh
```
2. ) Above commands updates the chromium to run at startup and add **swapMain.sh** to crontab. To check the consistency of these two steps, run the following command
```bash
cat /etc/xdg/autostart/nm-applet.desktop && echo ---------- && crontab -l
```
3. ) After ensuring all the data, simply reboot the system with command.

```bash
    reboot
```




## Support

For support, email ritik.sangwan@electrifuel.com or call me at +919050536764


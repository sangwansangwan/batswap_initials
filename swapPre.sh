#!/bin/bash


# --------------- Part to be edited before execution -------------------->
cron_command=""  # Provide absolute path of swapMain.sh
string="@chromium --kiosk http://batswap.electrifuel.com:3000"
#string="@chromium-browser --kiosk http://batswap.electrifuel.com:3000"
# Uncomment above line and comment line above that if chromium process name is chromium-broswer
# --------------- Part to be edited before execution -------------------->


# logic to add chromium to autostart----------------> 
file="/etc/xdg/lxsession/LXDE-pi/autostart"
if ! grep -qF "$string" "$file"; then
    sudo sh -c "echo '\n$string' >> '$file'"
fi
# -------------------------------------------------->


# logic to add cronjob after checking its existence---->
cron_schedule="@reboot"
existing_cron=$(crontab -l 2>/dev/null | grep -F "$cron_command")
if [ -z "$existing_cron" ]; then
    (crontab -l 2>/dev/null; echo "$cron_schedule $cron_command") | crontab -
    echo "Cron job added successfully."
else
    echo "The cron job already exists."
fi
#--------------------------------------------------------->
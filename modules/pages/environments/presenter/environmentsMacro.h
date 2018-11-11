#pragma once
#define MAIN_INFO "echo \"OS=$(uname -o)\"; echo \"Kernel=$(uname -r)\"; echo \"User=$(uname -n)\"; echo \"Arch=$(uname -m)\";  echo \"Shell=$(echo $SHELL)\"; echo \"Language=$(echo $LANG)\"; echo \"Editor=$(echo $EDITOR)\"; echo \"Pager=$(echo $PAGER)\"; echo \"DE=$(echo $XDG_CURRENT_DESKTOP)\"; echo \"Qt.ver=$(echo $QT_QPA_PLATFORMTHEME)\"; echo \"Display=$(echo $DISPLAY)\"; echo \"Bios/UEFI=$([ -d /sys/firmware/efi ] && echo UEFI || echo BIOS)\"; echo \"All Services=$(systemctl list-units -t service --all | wc -l)\"; echo \"Failed=$(systemctl list-units -t service --failed | wc -l)\"; echo \"Kernel Modules=$(lsmod | wc -l)\";"
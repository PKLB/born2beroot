ARCH=$(uname --all)
PCPU=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
VCPU=$(grep 'processor' /proc/cpuinfo | wc -l)
MEMUSE=$(free -m | grep Mem | awk '{printf "%d/%dMB (%.2f%%)", $3, $2, $3*100/$2}')
DISKUSE=$(df -h | grep root | awk '{print $3"/"$2"b ("$5")"}')
CPU=$(cat /proc/loadavg | awk '{printf "%.1f%%", $1}')
LASTBOOT=$(who -b | awk '{print $3" "$4}')
LVM=$(lsblk | grep 'lvm' | wc -l)
TCP=$(cat /proc/net/sockstat | awk '$1 == "TCP:" {print $3}')
USERLOG=$(who | wc -l)
IP=$(hostname --ip-address)
MAC=$(ip a | grep link/ether | awk '{printf $2}')
SUDO=$(journalctl _COMM=sudo  | grep 'COMMAND' | wc -l)

echo "#Architecture: ${ARCH}"
echo "#CPU Physical: ${PCPU}"
echo "#CPU Virtual: ${VCPU}"
echo "#Memory Usage: ${MEMUSE}"
echo "#Disk Usage: ${DISKUSE}"
echo "#CPU load: ${CPU}"
echo "#Last boot: ${LASTBOOT}"
echo "#LVM use: $(if [${LVM} -eq 0]; then echo no; else echo yes; fi)"
echo "#Connections TCP: ${TCP} ESTABLISHED"
echo "#User log: ${USERLOG}"
echo "#Network: IP ${IP} (${MAC})"
echo "#Sudo: ${SUDO} cmd"

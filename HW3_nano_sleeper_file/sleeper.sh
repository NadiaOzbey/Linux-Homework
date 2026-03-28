#!/bin/bash
for i in {1..10}
do
        echo "$(date +'%H:%M:%S') $(ps -ef --no-headers | wc -l) processes"
        #
        sleep 5
done


lscpu >> /opt/281125-wdm/nadia_ozbey/CPU_info.txt 2>/dev/null


grep '^NAME=' /etc/os-release >> /opt/281125-wdm/nadia_ozbey/OS_info.txt


grep '^NAME=' /etc/os-release | cut -d '=' -f2 | tr -d '"' >> /opt/281125-wdm/nadia_ozbey/OS_info_concise.txt

for j in {50..100}
do 
	touch "${j}.txt"
done


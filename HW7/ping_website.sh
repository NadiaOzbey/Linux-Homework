#!/bin/bash
target_address="multitran.com"
timeout_ms=100
fail_limit=3
fail-count=0

if ! command -v fping &>/dev/null; then
echo "Error: fping is not installed. Install it with sudo apt install fping"
exit 1
fi

while true; do
ping_time=$(fping -c 1 -t $timeout_ms $target_address 2>/dev/null | awk -F'/' '{print $6}')
	if [ -z "$ping_time" ]; then
	((fail_count++))



echo "ping to $target_address failed ($fail_count/$fail_limit)"
else 
ping_time=$(printf "%.0f" "$ping_time")

if (( $ping_time > $timeout_ms )); then
	echo "Ping time $ping_time ms exceeds $timeout_ms ms"
	((fail_count++))
else 
	fail_count=0
fi
fi



if (($fail_count >= $fail_limit)); then
	echo "Error: ping failed $fail_limit consecutive times!"
	fail_count=0
fi

sleep 1 

done

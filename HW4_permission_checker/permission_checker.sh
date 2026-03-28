#!/bin/bash
ls -la /opt/281125-wdm/
for file in /opt/281125-wdm/*.sh; do
	if [ -f '$file' ]; then
		chmod +x '$file'
	fi
done

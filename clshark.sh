#!/usr/bin/env bash

containerlab_host_address=$1
lab_node_name=$2
if_name=$3

if [[ -v WIRESAHRK_PATH ]]; then
	wireshrk_path="$WIRESAHRK_PATH"
elif [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
	wireshrk_path="/mnt/c/Program\ Files/Wireshark/Wireshark.exe"
else
	wireshrk_path="wireshark"
fi

ssh $containerlab_host_address \
"sudo ip netns exec $lab_node_name tcpdump -U -nni $if_name -w -" | \
eval $wireshrk_path -k -i -

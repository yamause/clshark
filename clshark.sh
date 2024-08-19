#!/usr/bin/env bash

set -euo pipefail

containerlab_host_address=$1
lab_node_name=$2
if_name=$3

if [[ -v "WIRESHARK_PATH" ]] && [[ -f "${WIRESHARK_PATH}" ]]; then
  wireshark_path="${WIRESHARK_PATH}"
# Use WSL.
elif [[ -f /mnt/c/Program\ Files/Wireshark/Wireshark.exe ]]; then
  wireshark_path="/mnt/c/Program\ Files/Wireshark/Wireshark.exe"
# Use POSIX.
elif [[ -f "/usr/local/bin/wireshark" ]]; then
  wireshark_path="/usr/local/bin/wireshark"
else
  echo "Wireshark not found. Install Wireshark, or if it is already installed, set the path in the environment variable WIRESAHRK_PATH." >&2
  exit 1
fi

ssh "${containerlab_host_address}" \
  "sudo ip netns exec ${lab_node_name} tcpdump -U -nni ${if_name} -w -" \
    | eval "${wireshark_path}" -k -i -

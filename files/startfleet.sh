#!/bin/sh

# Background this task so it will run after "fleet serve" - req'd to keep
# script from completing, which would lead to exit(0) on the container
{
# Wait for Fleet to come up
sleep 60

# First time config
/usr/local/bin/fleetctl config set --address https://127.0.0.1 --tls-skip-verify && \
/usr/local/bin/fleetctl setup --email guerillaBT@bsides.lab --username GuerillaBT --password 'bsid3s!' --org-name GuerillaBlueTeam && \
/usr/local/bin/fleetctl login --email guerillaBT@bsides.lab --password 'bsid3s!' && \

# Apply configs and packs
/usr/local/bin/fleetctl apply -f /etc/osquery/osquery-windows.yaml && \
/usr/local/bin/fleetctl apply -f /etc/osquery/osquery-linux.yaml && \
for pack in /etc/osquery/packs/*.yaml
  do /usr/local/bin/fleetctl apply -f "$pack"
done
} &

# Let's initialize the DB if it hasn't been done
/usr/bin/fleet prepare db

# Bring up Fleet in the background
/usr/bin/fleet serve

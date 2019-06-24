#!/bin/bash

ansible-playbook /opt/playbooks/kolide-fleet/update-run-fleet-containers.yml

echo "Waiting for osquery to start"

sleep 60

cd /opt/playbooks/windows-dc

/opt/playbooks/windows-dc/config-osquery.sh

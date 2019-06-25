#!/bin/bash

ansible-playbook /opt/playbooks/kolide-fleet/update-run-fleet-containers.yml

echo "Waiting for osquery to start"

cd /opt/playbooks/windows-dc

/opt/playbooks/windows-dc/config-osquery.sh

read -p "Press key to continue... " -n1 -s

# ansible playbook (local) for dockerized kolide-fleet with automated first-time setup.

To build/deploy, cd into this directory and run: sudo ansible-playbook -k fleet-run-all.yml

Fleet will be listening on https://127.0.0.1:8443 with a self-signed certificate. On a Linux host there should be a shortcut on the desktop pointing to Fleet's homepage. On a Windows PC, this playbook will surely fail...
...if you have problems, it works on my PC (CentOS 7 w/ KDE) so try that.

To update docker-compose and related configs, run the following: sudo ansible-playbook -k update-fleet-containers.yml
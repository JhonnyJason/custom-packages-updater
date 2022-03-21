#!/bin/bash
cp custom-packages-updater.sh /bin/
cp custom-packages-updater.service /etc/systemd/system/
cp custom-packages-updater.timer /etc/systemd/system/
systemctl daemon-reload
systemctl enable custom-packages-updater.timer
systemctl start custom-packages-updater.timer

#!/bin/sh -x

sh docker-cimprov-1.0.0-27.universal.x86_64.sh --install
VAR_DIR=/var/opt/microsoft/omsagent

cp -f /etc/opt/microsoft/omsagent/sysconf/omsagent.d/container.conf /etc/opt/microsoft/omsagent/conf/omsagent.d/container.conf
VAR_DIR_WS=$VAR_DIR
STATE_DIR=$VAR_DIR_WS/state
sed -i s,%STATE_DIR_WS%,$STATE_DIR,1 /etc/opt/microsoft/omsagent/conf/omsagent.d/container.conf
chown omsagent:omiusers /etc/opt/microsoft/omsagent/conf/omsagent.d/container.conf

#restart omsagent and omi
echo 'sudo /opt/omi/bin/service_control restart'
/opt/omi/bin/service_control restart
echo 'sudo /opt/microsoft/omsagent/bin/service_control restart'
/opt/microsoft/omsagent/bin/service_control restart

#!/bin/bash

MONGODB1=mongo1
MONGODB2=mongo2
MONGODB3=mongo3

PORT1=30001
PORT2=30002
PORT3=30003

echo "Waiting for ${MONGODB1}:${PORT1} to startup.."
until curl http://${MONGODB1}:${PORT1}/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done

echo SETUP.sh time now: `date +"%T" `
mongo --host ${MONGODB1} --port ${PORT1} <<EOF
var cfg = {
    "_id": "rs0",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 0,
            "host": "${MONGODB1}:${PORT1}",
            "priority": 2
        },
        {
            "_id": 1,
            "host": "${MONGODB2}:${PORT2}",
            "priority": 0
        },
        {
            "_id": 2,
            "host": "${MONGODB3}:${PORT3}",
            "priority": 0
        }
    ],settings: {chainingAllowed: true}
};
rs.initiate(cfg, { force: true });
rs.reconfig(cfg, { force: true });
rs.slaveOk();
db.getMongo().setReadPref('nearest');
db.getMongo().setSlaveOk(); 
EOF
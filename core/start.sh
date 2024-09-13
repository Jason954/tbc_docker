#!/bin/bash

#RUN cp /app/mangos-tbc/build/src/mangosd/mangosd.conf.dist /app/conf/mangosd.conf && \
 #    cp /app/mangos-tbc/build/src/mangosd/ahbot.conf.dist /app/conf/ahbot.conf && \
 #    cp /app/mangos-tbc/build/src/modules/PlayerBots/aiplayerbot.conf.dist /app/conf/aiplayerbot.conf && \
 #    cp /app/mangos-tbc/src/realmd/realmd.conf.dist.in /app/conf/realmd.conf
# check if the conf files exist
if [ ! -f /app/conf/mangosd.conf ]; then
    echo "mangosd.conf not found"
    # cp the default conf file
    cp /app/mangos-tbc/src/mangosd/mangosd.conf.dist /app/conf/mangosd.conf
fi

if [ ! -f /app/conf/realmd.conf ]; then
    echo "realmd.conf not found"
    # cp the default conf file
    cp /app/mangos-tbc/src/realmd/realmd.conf.dist /app/conf/realmd.conf
fi

if [ ! -f /app/conf/ahbot.conf ]; then
    echo "ahbot.conf not found"
    # cp the default conf file
    cp /app/mangos-tbc/build/src/mangosd/ahbot.conf.dist /app/conf/ahbot.conf
fi

if [ ! -f /app/conf/aiplayerbot.conf ]; then
    echo "aiplayerbot.conf not found"
    # cp the default conf file
    cp /app/mangos-tbc/build/src/modules/PlayerBots/aiplayerbot.conf.dis /app/conf/aiplayerbot.conf
fi



#/app/mangos-tbc/build/src/mangosd/mangosd -c /app/conf/mangosd.conf -a /app/conf/ahbot.conf -b /app/conf/aiplayerbot.conf > /app/logs/mangosd.log 2>&1 &
#/app/mangos-tbc/build/src/mangosd/mangosd -c /app/conf/mangosd.conf -a /app/conf/ahbot.conf > /app/logs/mangosd.log 2>&1 &
/app/mangos-tbc/build/src/mangosd/mangosd -c /app/conf/mangosd.conf -a /app/conf/ahbot.conf
/app/mangos-tbc/build/src/realmd/realmd -c /app/conf/realmd.conf
#/app/mangos-tbc/build/src/realmd/realmd -c /app/conf/realmd.conf > /app/logs/realmd.log 2>&1 &

#wait -n
# wait for all background jobs to finish
tail -f /dev/null

#!/bin/bash

######################################
# The values below should be changed #
# to contain your luminis root       #
# directory and server hostnames     #
######################################
lumdir="/lum"
servers=( "casserver.mydomain.edu" "webserver1.mydomain.edu" "webserver2.mydomain.edu" )
######################################
# Don't edit anything below here.    #
######################################

if test -z "$1"
then
    echo "Usage: $0 [operation]"
    echo "  Where [operation] is one of:"
    echo "  start"
    echo "  stop"
    echo "  restart"
    exit
fi

case "$1" in
    "start")
        cmd="sudo $lumdir/bin/lpstart"
        ;;
    "stop")
        cmd="sudo $lumdir/bin/lpstop"
        ;;
    "restart")
        cmd="sudo $lumdir/bin/lpstop;sudo $lumdir/bin/lpstart"
        ;;
    *)
        cmd="exit"
        ;;
esac

for server in "${servers[@]}"
do
    echo "Performing operation '$1' on server '$server'"
    ssh $server $cmd
done

echo "Performing operation '$1' on self."
$cmd

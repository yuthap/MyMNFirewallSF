#!/bin/bash

#add ICMP and ARP at priority 10
#usage ./ [mn_port] [source_port] [destination_port]

NM_P=${1:-6654}
IN_P=${2:-1}
OUT_P=${3:-2}

#echo "===="
#echo "$SW $NM_P $IN_P $OUT_P"
#echo "====="

ovs-ofctl add-flow tcp:127.0.0.1:$NM_P "table=0 arp,priority=10, \
 in_port=$IN_P,actions:outport=$OUT_P"
ovs-ofctl add-flow tcp:127.0.0.1:$NM_P "table=0 arp,priority=10, \
 in_port=$OUT_P,actions:outport=$IN_P"
ovs-ofctl add-flow tcp:127.0.0.1:$NM_P "table=0 icmp,priority=10, \
 in_port=$IN_P,actions:outport=$OUT_P"
ovs-ofctl add-flow tcp:127.0.0.1:$NM_P "table=0 icmp,priority=10, \
 in_port=$OUT_P,actions:outport=$IN_P"

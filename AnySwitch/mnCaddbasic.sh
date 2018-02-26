#!/bin/bash

#add ICMP and ARP at priority 10
#usage ./ switchname port

$1 ovs-ofctl add-flow tcp:127.0.0.1:$2 "table=0 arp,priority=10,in_port=2,actions:outport=1"
$1 ovs-ofctl add-flow tcp:127.0.0.1:$2 "table=0 arp,priority=10,in_port=1,actions:outport=2"
$1 ovs-ofctl add-flow tcp:127.0.0.1:$2 "table=0 icmp,priority=10,in_port=2,actions:outport=1"
$1 ovs-ofctl add-flow tcp:127.0.0.1:$2 "table=0 icmp,priority=10,in_port=1,actions:outport=2"

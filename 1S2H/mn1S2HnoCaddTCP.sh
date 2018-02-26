#!/bin/bash

#internal send syn only, create rule permit tcp from outside
s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0, priority=8, tcp,tcp_flags=+syn-ack,priority=9,in_port=1,actions=learn(table=0, priority8=, eth_type=0x0800,ip_proto=6,in_port=2,output=NXM_OF_IN_PORT[]),output:2"

#internal can always send tcp out
s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0, tcp,priority=8,in_port=1,actions=output:2"

#if fin is sent from h1, delete learned rule
s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0, tcp,tcp_flags=+fin,priority=9,in_port=1,actions=learn(table=0, priority=9, delete_learned),output:2"

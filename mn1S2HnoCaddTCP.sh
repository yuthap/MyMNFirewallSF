#!/bin/bash

s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0, tcp,tcp_flags=+syn-ack,priority=9,in_port=1,actions=learn(table=0, eth_type=0x0800,ip_proto=6,in_port=2,output=NXM_OF_IN_PORT[]),output:2"

#!/bin/sh
s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0 priority=1 in_port=1, actions:outport=2"
s1 ovs-ofctl add-flow tcp:127.0.0.1:6654 "table=0 priority=1 in_port=2, actions:outport=1"

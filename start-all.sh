#!/bin/bash
mkdir -p ~/logs
nohup nutch namenode 2>&1 > ~/logs/nn.log &
nohup nutch datanode 2>&1 > ~/logs/dn.log &
nohup nutch jobtracker 2>&1 > ~/logs/jt.log &
nohup nutch tasktracker 2>&1 > ~/logs/tt.log &

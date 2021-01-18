#!/bin/bash
#This script kills the script-server web application
PID=$(ps aux | grep 'python3 ./launcher.py' | awk '{print$2}')
kill $PID

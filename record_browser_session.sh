#!/bin/bash

URL="google.com"

sslkeylogfile="$HOME/sslkey.log"

SSLKEYLOGFILE="$sslkeylogfile" firefox "$URL" & # launch firefox as subprocess

# capturing traffic and save to 'recording.pcap'
# the option 'tls.keylog_file' tells tshark where to find the logged TLS session keys
# you must configure wireshark/tshark accordingly if you want to allow packet capturing for non-root users

tshark -o "tls.keylog_file:$sslkeylogfile" -w recording.pcap


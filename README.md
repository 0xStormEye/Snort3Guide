# Snort3Guide
### This repo provides guidelines and references of using Snort 3.

---

#### Default Snort 3 testing config: [Link](https://github.com/0xStormEye/Snort3Guide/blob/master/test.lua)

Feature:
 - By default, all alerts are printed to STDOUT with alert_full.
 - CHECKSUM_MODE off for parsing pcap files wthout dropping packets.
 - Verbose mode on.
 - Showing debug message of each rule, i.e. fast_pattern matching.
 - Disabled all builtin rles.

#### Snort 3 PCRE reference: [Link](https://github.com/0xStormEye/Snort3Guide/blob/master/pcre.md)

Features:
 - Removed Snort 3 deprecated options.

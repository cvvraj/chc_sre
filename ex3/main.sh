#!/bin/bash

awk '{ print "[" $7 "]" }' ./sample.txt |  sed 's,/pic/,,g'

awk '{ print "[" $7 "] with code: ["$9 "]"} ' ./sample.txt | sed 's,/pic/,,g'

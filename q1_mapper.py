#!/usr/bin/env python

import sys

for line in sys.stdin:
    line = line.strip()
    d = line.split()
    if len(d) == 2:
    	try:
    		print '%s\t%s' % (d[0],d[1])
    	except:
    		continue
    
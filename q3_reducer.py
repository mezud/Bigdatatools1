#!/usr/bin/env python

from operator import itemgetter
import sys

for line in sys.stdin:
    line = line.strip()
    ids,dept,course = line.split("\t",2)
    
    try:
    	ids=int(ids)
    except ValueError:
    	continue
    
    if dept == "QA" or course == "Math":
        print "%s\t%s\t%s" % (ids,dept,course)



#!/usr/bin/env python

import sys
from operator import itemgetter

current_dept = None
current_min = 0

for line in sys.stdin:
    line = line.strip()
    dept, salary = line.split('\t',1)
    
    try:
        salary = int(salary)
    except ValueError:
        continue

    if dept == current_dept:
        if int(salary) < current_min:
            current_min = int(salary)
    else:
        if current_dept:
            print '%s\t%s' % (current_dept, current_min)
        current_dept = dept
        current_min = int(salary)
    
print '%s\t%s' % (current_dept, current_min)


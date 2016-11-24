#!/usr/bin/env python

import sys

for line in sys.stdin:
    line= line.strip()
    word = line.split(',',2)
    if len(word) == 3:
        try:
            print '%s\t%s\t%s' % (word[0],word[1],word[2])
        except:
            continue


        

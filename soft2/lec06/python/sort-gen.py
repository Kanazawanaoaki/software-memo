#!/usr/bin/env python

import argparse
import random
from datetime import datetime

def output_rand(length, fname):
    random.seed(datetime.now())
    ret = []

    for i in range(length):
        ret.append(random.randint(0, 1000))

    f = open(fname, 'w')
    f.write('%s'%ret)
    print(ret)

    f = open(fname, 'r')
    l = eval(f.read())
    for n in l:
        print n

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-o', dest='fname', default='rand.txt')
    # parser.add_argument('-c', dest='length',default=100)
    parser.add_argument('-n', dest='length', type=int, default=100)

    args = parser.parse_args()
    fname = args.fname
    length = args.length
    print('writing data with %d length to %s'%(length, fname))
    output_rand(length, fname)

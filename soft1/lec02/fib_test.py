# -*- coding: utf-8 -*-

## 再帰のフィボナッチ
def fibr(k):
    if k == 0 or k == 1:
        return 1
    else:
        return fibr(k-1)+fibr(k-2)

## 数え上げのフィボナッチ
def fibl(k):
    f = 1
    p1 = 1
    for i in range(2, k+1):
        p2 = p1
        p1 = f
        f = p1 + p2
    return f

f = open('test.dat', 'w')
import time
for i in range(35):
    start = time.time()
    fibr(i)
    elapsed_r = time.time() - start
    start = time.time()
    fibl(i)
    elapsed_l = time.time() - start
    print ("fibr({}) elapsed_time : {} [sec]".format(i, elapsed_r))
    print ("fibl({}) elapsed_time : {} [sec]".format(i, elapsed_l))
    f.write('{} {} {}\n'.format(i , elapsed_r ,elapsed_l))
f.close()


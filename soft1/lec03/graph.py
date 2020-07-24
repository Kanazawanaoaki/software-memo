# -*- coding: utf-8 -*-

# データの探索

## 線形探索
def find(x ,key):
    for data in x:
        if key == data:
            return True
    return False

## 二分探索
def bsearch_r(x, key):
    if x == []:
        return False
    middle = len(x)/2
    if key < x[middle]:
        return bsearch_r(x[:middle], key)
    elif x[middle] < key:
        return bsearch_r(x[midle+1:], key)
    else:
        return True
    
def bsearch_l(x, key):
    low = 0
    high = len(x) -1
    while low <= high:
        middle = (low + high)/2
        if key < x[middle]:
            high = middle - 1
        elif x[middle] < key:
            low = middle + 1
        else:
            return True
    return False

import time
f = open('search.dat', 'w')
for n in range(25):
    # リストを準備
    a = [(y - 1) + y for y in range(2**n)]
    # 線形探索の計算時間を計測
    start = time.time()
    find(a, 1000)
    e_l = time.time() - start
    # 二分探索の計算時間を計測
    start = time.time()
    bsearch_l(a, 1000)
    e_b = time.time() - start
    print('{}, linear {}, binary {}'.format(len(a), e_l, e_b))
    f.write('{} {} {} {}\n'.format(len(a), n, e_l, e_b))
f.close()

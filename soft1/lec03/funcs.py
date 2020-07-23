# -*- coding: utf-8 -*-

# リストの基本処理関数を実装する

## 長さを返す関数
def my_length_r(x):
    if x == []:
        return 0
    else:
        return 1 + my_length_r(x[1:])

def my_length_l(x):
    l = 0
    for e in x:
        l = l + 1
    return l

## リバース
def my_reverse_r(x):
    if x == []:
        return []
    else:
        return my_reverse_r(x[1:]) + x[0:1]

def my_reverse_l(x):
    r = []
    for e in x:
        r = [e] + r
    return r

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

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
    # middle = len(x)/2
    middle = int(len(x)/2)
    if key < x[middle]:
        return bsearch_r(x[:middle], key)
    elif x[middle] < key:
        return bsearch_r(x[middle+1:], key)
    else:
        return True
    
def bsearch_l(x, key):
    low = 0
    high = len(x) -1
    while low <= high:
        # middle = (low + high)/2
        middle = int((low + high)/2)
        if key < x[middle]:
            high = middle - 1
        elif x[middle] < key:
            low = middle + 1
        else:
            return True
    return False

## 選択ソート
def selection_sort(x):
    ret = []
    for i in range(len(x)):
        min_i = 0
        min_e = x[min_i]
        for j in range(len(x)):
            e = x[j]
            if e <= min_e:
                min_e = e
                min_i = j
        ret = ret + [x[min_i]]
        x = x[0:min_i] + x[min_i+1:]
    return ret

def min_index(a,st):
  minidx=st # 先頭の要素のインデックスを最小値のインデックスとする
  for i in range(st+1,len(a)): # i番目のほうが最小値よりも小さいなら
    if a[i] < a[minidx]: # iを最小値のインデックスをする
      minidx = i
  return minidx

def selection_sort_2(x):
    for i in range(len(x)):
        k = min_index(x, i)
        tmp = x[i]
        x[i] = x[k]
        x[k] = tmp
        print(i)
    return x

## マージソート
def merge(x,y):
    ix = 0; iy = 0
    z = []
    while ix < len(x) and iy < len(y):
        if x[ix] < y[iy]:
            z = z + [x[ix]]; ix = ix + 1
        else:
            z = z + [y[iy]]; iy = iy + 1
    if ix < len(x):
        z = z + x[ix:]
    else:
        z = z + y[iy:]
    return z

def merge_sort(x):
    if len(x) <= 1:
        return x
    else:
        mid = len(x)/2
        left = merge_sort(x[:mid])
        right = merge_sort(x[mid:])
        return merge(left, right)

## クイックソート
def quick_sort_impl(x, first, last):
    if first >= last:
        return x
    pivot = x[(first+last)/2]; i = first; j = last; ok = True
    while ok == True:
        while x[i] < pivot:
            i = i + 1
        while pivot < x[j]:
            j = j - 1
        if i >= j:
            ok = False
        else:
            tmp = x[i]; x[i] = x[j]; x[j] = tmp; i = i + 1; j = j - 1
    if first < i - 1:
        quick_sort_impl(x, j+1, last)
    return x

def quick_sort(x):
    return quick_sort_impl(x, 0, len(x)-1)

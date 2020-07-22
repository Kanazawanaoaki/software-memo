# -*- coding: utf-8 -*-

## 3通りの場合分け

def sign(x):
    if x < 0:
        return -1
    else:
        if 0 < x:
            return 1
        else:
            return 0

# def sign(x):
#     if x < 0:
#         return -1
#     elif 0 < x:
#         return 1
#     else:
#         return 0


## 関数を条件式の中で使う

def is_even(x):
    return(x%2==0)

def tnpo(n): #three n plus one
    if is_even(n):
        return n/2
    else:
        return 3*n+1

## 繰り返しによる和の定義

def sum_loop(n):
    s = 0
    for i in range(n):
        s = s + (i+1)
    return s

## 条件を満たす値を繰り返し

def divisible(m,n):
    return m % n == 0

def gd_loop(k,n):
    while not divisible(k,n):
        n = n-1
    return n

###再帰

## 再帰による和の定義

def sum(n):
    if n == 1:
        return 1
    else:
        return sum(n-1)+n

## 約数の和

def sod(k,n):
    if n==1:
        return 1
    else:
        if divisble(k,n):
            return sod(k,n-1)+n
        else:
            return sod(k,n-1)

def gd(k,n):
    if divisible(k,n):
        return n
    else:
        return gd(k,n-1)


### アルゴリズムと計算量

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

## フィボナッチ数の近似値
import math
def fibk(k):
    phi = (1.0 + math.sqrt(5))/2.0
    return (phi ** (k+1))/math.sqrt(5)

## 実行時間を計測
import time
def elapsed_time(f,i):
    start= time.time()
    f(i)
    elapsed = time.time() - start
    print ("elapsed time {} : {} [sec]".format(i, elapsed))

for i in range(35):
    elapsed_time(fibr, i)

for i in range(0, 35000 ,100):
    elapsed_time(fibl,i)

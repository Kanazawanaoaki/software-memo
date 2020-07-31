#!/usr/bin/env python
# -*- coding: utf-8 -*-

def bubble_sort(num):
    for i in range(len(num)):
        for n in range(len(num)-1,i,-1):
            if num[n] < num[n-1] : # 比較対象の数字が一つ前の数字より小さければ入れ換える
                tmp = num[n]
                num[n] = num[n-1]
                num[n-1] = tmp
    return num

if __name__ == '__main__' :
    f = open('rand.txt', 'r')
    num = eval(f.read())

    bubble_sort(num)
    print(num)

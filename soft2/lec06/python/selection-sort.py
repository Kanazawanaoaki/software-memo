#!/usr/bin/env python
# -*- coding: utf-8 -*-

def selection_sort(num):
    for i in range(len(num)):
        min = num[i] # 仮の最小値
        min_pos = i # 仮の最小値の場所
        for n in range(i+1, len(num)):
            if num[n] < min : # 比較対象の数字が仮の最小値より小さければ，仮の最小値を更新
                min = num[n]
                min_pos = n
        tmp = num[i] # 最小値と最初の数を入れ替え
        num[i] = min
        num[min_pos] = tmp
    return num

if __name__ == '__main__' :
    f = open('rand.txt', 'r')
    num = eval(f.read())

    selection_sort(num)
    print(num)

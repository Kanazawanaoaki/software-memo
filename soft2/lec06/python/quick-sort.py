#!/usr/bin/env python
# -*- coding: utf-8 -*-

def quick_sort_impl(num, first, last):
    x = (num[first] + num[last])/2
    i = first
    j = last
    while True:
        while num[i] < x:
            i+=1
        while x < num[j]:
            j-=1
        if i >= j:
            break
        num[i], num[j] = num[j], num[i]
        i+=1;
        j-=1
    if first < i - 1:
        quick_sort_impl(num, first, i - 1)
    if j + 1 < last:
        quick_sort_impl(num, j + 1, last)

def quick_sort(num):
    quick_sort_impl(num, 0, len(num)-1)

if __name__ == '__main__' :
    f = open('rand.txt', 'r')
    num = eval(f.read())

    quick_sort(num)
    print(num)

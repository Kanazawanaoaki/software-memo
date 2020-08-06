#!/usr/bin/env python

u = 0.25
def main():
    w = [0.125, 0.125, 0.25]
    o = [0, 0, 0, 0]
    xs = [[0, 0, 1], [0, 1, 1], [1, 0, 1], [1, 1, 1]]
    ys = [-1, -1, -1, 1]
    while o != ys:
        for j in [0, 1, 2, 3]:
            o[j] = predict(w, xs[j])
            if o[j] != ys[j]:
                w = update(w, xs[j], ys[j])
        print(o)
    print(w)

    
def update(w, x, y):
    return [i + u * y * j for (i, j) in zip(w, x)]
    
def sum (f, a, b):
    if a > b:
        return 0
    else:
        return (f(a) + sum(f, a+1, b))
    
def predict(w, x):
    a = sum(lambda a: w[a]*x[a], 0, 2)
    if a >= 0:
        return 1
    else:
        return -1

main()
    

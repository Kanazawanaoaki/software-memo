# soft lec02
ソフトウェア第一の第２回.  

```python
In [1]: exec(open('max.py').read())

In [2]: max(123,456)
Out[2]: 456

In [3]: max(max(12,34),max(56,78))
Out[3]: 78

In [4]: 123 > 123
Out[4]: False

In [5]: 123 >= 123
Out[5]: True

In [6]: 123 == 456
Out[6]: False

In [7]: 123 < 456
Out[7]: True

In [8]: 123 <= 123
Out[8]: True

In [9]: 123 != 456
Out[9]: True

In [10]: x = 10

In [11]: 1 < x
Out[11]: True

In [12]: x == 2
Out[12]: False

In [13]: ret = x == 2

In [14]: print(ret)
False

In [15]: 10 > 5 or 10 == 0
Out[15]: True

In [16]: 5 < 10 and 10 < 15
Out[16]: True

In [17]: not(5 < 10 and 10 < 15)
Out[17]: False

In [18]: def is_even(x):
    ...:     ret = (x%2 == 0)
    ...:     return ret
    ...:

In [19]: is_even(2)
Out[19]: True

In [20]: is_even(3)
Out[20]: False

In [21]: for i in range (5):
    ...:     print(i)
    ...:
0
1
2
3
4

In [22]: for i in range (1,5):
    ...:     print(i)
    ...:
1
2
3
4

In [23]: for i in range (1,5,2):
    ...:     print(i)
    ...:
1
3

In [24]: exec(open('funcs.py').read())

In [25]: gd_loop(6,5)
Out[25]: 3
```

- 繰り返し  
```python
for 変数 in リスト:
  式
```
`range()`関数を利用すると便利.

- 条件を満たすまでの繰り返し
```python
while 条件:
  式
```

- 再帰(recursive)
繰り返しで値を求めるような計算f(n)はf(n)とf(n-1)の関係を見つければ,再帰関数として定義できる.

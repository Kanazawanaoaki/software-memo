# soft1 lec01
ソフトウェア第一の第一回.  
`ipython`でプログラムを立ち上げる.  
数式など.
```
In [1]: print("Hello, world!")
Hello, world!

In [2]: 1+1
Out[2]: 2

In [3]: quit()
```
```
In [1]: 7-2 #引き算
Out[1]: 5

In [2]: 7*2 #掛け算
Out[2]: 14

In [3]: 7/2 #割り算の商
Out[3]: 3.5

In [4]: 7%2 #割り算の余り
Out[4]: 1

In [5]: 7**2 #累乗
Out[5]: 49

In [6]: (7-2)*3 #カッコも使える
Out[6]: 15

In [7]: 7 / 2
Out[7]: 3.5

In [8]: 7 / 2.0
Out[8]: 3.5

In [9]: 7.0 / 2
Out[9]: 3.5

In [11]: import math

In [12]: math.sqrt(2)
Out[12]: 1.4142135623730951

In [13]: math.cos(math.pi/3)
Out[13]: 0.5000000000000001

In [14]: r = 2.5

In [15]: math.pi * r ** 2
Out[15]: 19.634954084936208

In [18]: r = 10

In [19]: math.pi * r ** 2
Out[19]: 314.1592653589793

In [20]: def area(r):
    ...:     return math.pi * r ** 2
    ...:

In [21]: area(2.5)
Out[21]: 19.634954084936208

In [22]: area(10)
Out[22]: 314.1592653589793

In [23]: def diameter_to_radius(l):
    ...:     return l/2
    ...:

In [24]: def area_diameter(l):
    ...:     return area(diameter_to_radius(l))
    ...:

In [25]: area(2.5)
Out[25]: 19.634954084936208

In [27]: area_diameter(5.0)
Out[27]: 19.634954084936208

In [28]: def heron(a, b, c):
    ...:     s = 0.5 * (a + b + c)
    ...:     return math.sqrt(s * (s-a) * (s-b) * (s-c))
    ...:

In [29]: heron(3,4,5)
Out[29]: 6.0
```
ファイルを読み込み入出力など.  
```
In [1]: execfile('hello.py')
---------------------------------------------------------------------------
NameError                                 Traceback (most recent call last)
<ipython-input-1-07527f7be94e> in <module>
----> 1 execfile('hello.py')

NameError: name 'execfile' is not defined

In [2]: exec(open('hello.py').read())
Hello, world!

In [3]: area(10)
Out[3]: 314.1592653589793

In [4]: r = 10

In [5]: print(r)
10

In [6]: print(r,area(r))
10 314.1592653589793

In [7]: print('area of a circle with radius of {} is {} '.format(r,area(r)))
area of a circle with radius of 10 is 314.1592653589793

In [8]: r = input('input radius : ')
input radius : 2.5

In [9]: print(r)
2.5
```

## Unix, Emacsの使い方資料
- コマンド  
https://hwb.ecc.u-tokyo.ac.jp/wp/information-2/cui/

- コマンドを使ったファイル操作  
https://hwb.ecc.u-tokyo.ac.jp/wp/information-2/filesystem/cui-fs/  
- Emacs  
https://hwb.ecc.u-tokyo.ac.jp/wp/literacy/editor-2/emacs/

# soft lec03
ソフトウェア第一の第３回.  

```python
In [1]: a = [2, 7, 4, 1, 6]

In [2]: a[0]
Out[2]: 2

In [3]: a[3]
Out[3]: 1

In [4]: a[-1]
Out[4]: 6

In [5]: a[1:4]                                                                                       
Out[5]: [7, 4, 1]

In [6]: a[1:]                                                                                        
Out[6]: [7, 4, 1, 6]

In [7]: a[:3]                                                                                        
Out[7]: [2, 7, 4]

In [8]: a                                                                                            
Out[8]: [2, 7, 4, 1, 6]

In [9]: a[2] = 100                                                                                   

In [10]: a                                                                                           
Out[10]: [2, 7, 100, 1, 6]

In [11]: a[2:4] = [4,2,1]                                                                            

In [12]: a                                                                                           
Out[12]: [2, 7, 4, 2, 1, 6]

In [14]: import math                                                                                 

In [15]: [1 + 2,3-4.0,math.pi,math.sqrt(3)]                                                          
Out[15]: [3, -1.0, 3.141592653589793, 1.7320508075688772]

In [16]: b = [[1,2,3],[4,5,6],[7,8,9]]                                                               

In [17]: b[0]                                                                                        
Out[17]: [1, 2, 3]

In [18]: b[0][1]                                                                                     
Out[18]: 2

In [19]: len(a)                                                                                      
Out[19]: 6

In [20]: a[::-1]                                                                                     
Out[20]: [6, 1, 2, 4, 7, 2]

In [21]: a + [5,8,4,1]                                                                               
Out[21]: [2, 7, 4, 2, 1, 6, 5, 8, 4, 1]

In [22]: sorted(a)                                                                                   
Out[22]: [1, 2, 2, 4, 6, 7]

In [23]: a                                                                                           
Out[23]: [2, 7, 4, 2, 1, 6]
```

データ探索とソート
```python
In [1]: exec(open('funcs.py').read())                                                                

In [2]: find([2,7,4,2,1,6], 3)                                                                       
Out[2]: False

In [3]: find([2,7,4,2,1,6], 4)                                                                       
Out[3]: True

In [6]: bsearch_r([1, 2, 2, 4, 6, 7], 3)                                                             
Out[6]: False

In [7]: bsearch_r([1, 2, 2, 4, 6, 7], 4)                                                             
Out[7]: True

In [8]: import random                                                                                

In [9]: b = [random.randint(0, 100000) for y in range(100000)]                                       

In [10]: c = selection_sort_2(b)                                                                     
```

破壊的操作と非破壊的操作  
```python
In [1]: a = [2,7,4,2,1,6]

In [2]: a[::-1]
Out[2]: [6, 1, 2, 4, 7, 2]

In [3]: a
Out[3]: [2, 7, 4, 2, 1, 6]

In [4]: list(reversed(a))
Out[4]: [6, 1, 2, 4, 7, 2]

In [5]: a
Out[5]: [2, 7, 4, 2, 1, 6]

In [6]: a.reverse()

In [7]: a
Out[7]: [6, 1, 2, 4, 7, 2]
```
`a.sort()`破壊的操作,`sorted(a, reverse=True)`降順でソート

グラフを描画する
```
gnuplot -e 'plot "search.dat" using 1:3 with lp title "linear search" , "search.dat" using 1:4 with lp title "binary search"; pause -1'
```

## おまけ
おまけだけど、めっちゃ重要.
### is と　==  
== は等価性, is は同一性.  
[1,2]をもう一つ作ると,等価だが同一ではない.  
```python
In [1]: x = [1,2]                                                                                    

In [2]: y = x                                                                                        

In [3]: x is y                                                                                       
Out[3]: True

In [4]: x == y                                                                                       
Out[4]: True

In [5]: y = [1,2]                                                                                    

In [6]: x == y                                                                                       
Out[6]: True

In [7]: x is y                                                                                       
Out[7]: False

In [8]: z = y[:]                                                                                     

In [9]: y == z                                                                                       
Out[9]: True

In [10]: y is z                                                                                      
Out[10]: False
```

### 値呼びと参照呼び
値呼び：呼び出す側の引数の値を呼び出された関数の仮引数へコピーして渡す.(call by value)  
参照呼び：呼び出す側の引数の変数への参照を関数の仮引数へ渡す.(call by reference)  
以下のプログラムのfoo()の呼び出しの後で,xの値が変われば参照呼び,そうでなければ,値呼び.  
```python
In [2]: def foo(a):
   ...:     a = 100
   ...:     print(a)
   ...:                                                                                              

In [3]: x = 10                                                                                       

In [4]: foo(x)                                                                                       
100

In [6]: print(x)                                                                                     
10
```

### リストの破壊的操作関数
Pythonでは変数は全て実体への参照  
関数呼び出しは,正しくは参照の値渡し  
(bar関数の中の仮引数aと,bar関数の呼び出し元の変数xは同じリスト.コピーされていない.)
関数の引数にリストを渡し,受け取った関数内でそのリストを修正すると,呼び出し元も書き換わる.
```python
In [1]: def bar(a):
   ...:     return a is x
   ...:

In [2]: x = [1,2]

In [3]: bar(x)
Out[3]: True
```

# soft lec04
ソフトウェア第一の第４回.  

## オブジェクト
関数からオブジェクトになった.  
データと関数をまとめたものをオブジェクトと呼ぶ.そのオブジェクトを中心にしてプログラムを作る.  

### オブジェクト指向言語の特徴
- カプセル化  
- 継承（インヘリタンス）  
- 多態性（ポリモーフィズム）  

クラス、オブジェクトの振る舞いを記述したもの  
クラスを実体化したものがインスタンス（オブジェクト）  

```python
In [1]: exec(open('class_test.py').read())

In [3]: kei = Customer('Kei Okada',1000)                                                             

In [4]: kei.name                                                                                     
Out[4]: 'Kei Okada'

In [5]: kei.balance                                                                                  
Out[5]: 1000
```
```Python
In [1]: exec(open('class_test.py').read())                                                           

In [2]: kei = Customer('Kei Okada', 1000)                                                            

In [3]: bill = Customer('Bill Gates', 100000)                                                        

In [4]: kei.withdraw(100)                                                                            
Out[4]: 900

In [5]: kei.deposit(10)                                                                              
Out[5]: 910

In [6]: bill.balance                                                                                 
Out[6]: 100000

In [7]: acord = Car(0 , 'Honda', 'Acord')                                                            

In [8]: giga = Truck(0, 'Isuzu', 'Giga')                                                             

In [9]: acord.price()                                                                                
Out[9]: 8000.0

In [10]: giga.price()                                                                                
Out[10]: 10000.0
```
クラス変数  
```Python
In [1]: exec(open('class_test.py').read())                                                           

In [2]: nsx = SuperCar('Honda', 'NSX')                                                               

In [3]: dino = SuperCar('Ferrari', 'Dino')                                                           

In [4]: print('nsx: {}, dino {}'.format(nsx.wheel, dino.wheel))                                      
nsx: 4, dino 4

In [5]: SuperCar.wheel = 6                                                                           

In [6]: print('nsx: {}, dino {}'.format(nsx.wheel, dino.wheel))                                      
nsx: 6, dino 6

In [7]: nsx.wheel = 4                                                                                

In [8]: print('nsx: {}, dino {}'.format(nsx.wheel, dino.wheel))                                      
nsx: 4, dino 6
```

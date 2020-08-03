# software2 lec09
ソフトウェア第二の第９回．

Pythonによる浮動小数点演算の数値誤差確認  
```Python
>>> from decimal import *
>>> getcontext().prec = 6
>>> a, b, c = Decimal(111113), Decimal(-111111), Decimal('7.51111')
>>> (a + b) + c
Decimal('9.51111')
>>> a + (b + c)
Decimal('10')
>>> u, v, w = Decimal(20000), Decimal(-6), Decimal('6.00003')
>>> u * (v + w)
Decimal('0.60000')
>>> u * v + u * w
Decimal('1')
```

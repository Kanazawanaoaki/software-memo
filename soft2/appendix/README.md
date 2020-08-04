# software2 appendix
ソフトウェア第二の付録．記号処理による推論．  

## マッチング
変数を含むパターンとのマッチング
```lisp
eus$ (equal '(a b c) '(a b c))
t                                                                         
eus$ (equal '(?x b c) '(a b c))
nil    
```

?で始まる変数の判定
```lisp
1.eus$ (symbol-name 'abc)
"ABC"
2.eus$ (symbol-name '?abc)
"?ABC"
3.eus$ (elt "ABC" 0)
65
4.eus$ (char "?ABC" 0)
63
5.eus$ #\?
63

$ eus list-3-2-2.l
1.eus$ (variable-p '?a)
t
2.eus$ (variable-p 'a)
nil
```

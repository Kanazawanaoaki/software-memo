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
```Lisp
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

マッチング関数の構造
```Lisp
eus$ (match '(?a ?a) '(x y))
t                                                                          
eus$ (match '(?a ?a) '(x x))
t    
```

バインディング情報を持ったmatch関数
```Lisp
eus$ (match '(?a ?a) '(x y))
fail                                                                       
eus$ (match '(?a ?a) '(x x))
((?a . x))
```

ハッシュ表によるバインディング情報の管理
```Lisp
eus$ (setq htab (make-hash-table))
#<hash-table #X5647b8635e08 0/10>
eus$ (setf (gethash 10 htab) 20)
20
eus$ (setf (gethash 'a htab) 'b)
b
eus$ (gethash 10 htab)
20
eus$ (gethash 'a htab)
b
eus$ (gethash 'b htab)
nil
```

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
```Lisp
eus$ (sxhash 10)
10
eus$ (sxhash 20)
20
eus$ (sxhash '(10 20))
30
eus$ (sxhash 'a)
70
eus$ (sxhash 'b)
71
eus$ (sxhash '(a b))
141
```
```Lisp
$ eus list-3-2-5.l
eus$ (setq htab (make-hash-table :test #'equal))
#<hash-table #X55f45a49ad90 0/10>
eus$ (setf (gethash '(10 20) htab) 30)
30
eus$ (setf (gethash '(a b) htab) 'c)
c
eus$ (gethash '(10 20) htab)
30
eus$ (gethash '(a b) htab)
c
```
```Lisp
$ eus list-3-2-5.l
eus$ (match '(?a ?a) '(x x))
#<hash-table #X561ca624bd90 1/10>
eus$ (match '(?a ?a) '(x y))
fail
```
バインディング情報に基づく置換
```Lisp
$ eus list-3-2-6.l
eus$ (substitute-bindings (match '(?x ?y) '(a b)) '(x ?x y (?y (?x) ((?y)))))
(x a y (b (a) ((b))))
eus$ (substitute-bindings (match '(?x ?y) '(a b)) '(x ?x y (?y (?x) ((?z)))))
(x a y (b (a) ((?z))))
eus$ (trace substitute-bindings)
(substitute-bindings)
eus$ (substitute-bindings (match '(?x ?y) '(a b)) '(x (?y (?x))))
;;
1: --> substitute-bindings (((?y . b) (?x . a)) (x (?y (?x))));;
2: --> substitute-bindings (((?y . b) (?x . a)) x);;
2: x <-- substitute-bindings;;
2: --> substitute-bindings (((?y . b) (?x . a)) ((?y (?x))));;
3: --> substitute-bindings (((?y . b) (?x . a)) (?y (?x)));;
4: --> substitute-bindings (((?y . b) (?x . a)) ?y);;
4: b <-- substitute-bindings;;
4: --> substitute-bindings (((?y . b) (?x . a)) ((?x)));;
5: --> substitute-bindings (((?y . b) (?x . a)) (?x));;
6: --> substitute-bindings (((?y . b) (?x . a)) ?x);;
6: a <-- substitute-bindings;;
6: --> substitute-bindings (((?y . b) (?x . a)) nil);;
6: nil <-- substitute-bindings;;
5: (a) <-- substitute-bindings;;
5: --> substitute-bindings (((?y . b) (?x . a)) nil);;
5: nil <-- substitute-bindings;;
4: ((a)) <-- substitute-bindings;;
3: (b (a)) <-- substitute-bindings;;
3: --> substitute-bindings (((?y . b) (?x . a)) nil);;
3: nil <-- substitute-bindings;;
2: ((b (a))) <-- substitute-bindings;;
1: (x (b (a))) <-- substitute-bindings
(x (b (a)))
eus$ (untrace substitute-bindings)
nil
```

## プロダクションシステム
```Lisp
$ eus list-3-3-2.l
eus$ (macroexpand '(<- (human ?x) (woman ?x)))
(setq *rules* (cons (cons '(human ?x) (list '(woman ?x))) *rules*))
eus$ (macroexpand '(push x y))
(setq y (cons x y))
```

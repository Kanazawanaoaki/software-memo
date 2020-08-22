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
プロダクションルールの表現
```Lisp
$ eus list-3-3-2.l
eus$ (macroexpand '(<- (human ?x) (woman ?x)))
(setq *rules* (cons (cons '(human ?x) (list '(woman ?x))) *rules*))
eus$ (macroexpand '(push x y))
(setq y (cons x y))
```
条件部と作業記憶のマッチング
```Lisp
$ eus list-3-3-3.l
eus$ (match-antecedent '((child ?x ?y) (parent ?y ?x))
'((parent donald nancy) (male donald) (female nancy)))
((?x . nancy) (?y . donald))
eus$ (match-antecedent '((daughter ?x ?y) (and (child ?x ?y) (female ?x)))
'((child nancy donald) (parent donald nancy) (male donald) (female nancy)))
((?y . donald) (?x . nancy))
eus$ (setq *rules* '(((daughter ?y ?x) (and (child ?y ?x) (female ?y)))
((child ?x ?y) (parent ?y ?x))
((father ?x ?y) (and (parent ?x ?y) (male ?x)))))
(((daughter ?y ?x) (and (child ?y ?x) (female ?y))) ((child ?x ?y) (parent ?y ?x)) ((father ?x ?y) (and (parent ?x ?y) (male ?x))))
eus$ (select-conflict-set '((parent donald nancy) (male donald) (female nancy)))
(((child ?x ?y) (parent ?y ?x)) ((father ?x ?y) (and (parent ?x ?y) (male ?x))))
eus$ (select-conflict-set '((child nancy donald) (parent donald nancy)
(male donald) (female nancy)))
(((daughter ?y ?x) (and (child ?y ?x) (female ?y))) ((child ?x ?y) (parent ?y ?x)) ((father ?x ?y) (and (parent ?x ?y) (male ?x))))
```

競合解消
```Lisp
$ rlwrap eus list-3-3-4.l
eus$ (conflict-resolution
(select-conflict-set
'((parent donald nancy)
(male donald)
(female nancy))))
((child ?x ?y) (parent ?y ?x))
eus$ (conflict-resolution
(select-conflict-set
'((child nancy donald)
(parent donald nancy)
(male donald)
(female nancy))))
((daughter ?y ?x) (and (child ?y ?x) (female ?y)))
```

行動の実行
```Lisp
$ eus list-3-3-5.l
eus$ (setq rule '((child ?x ?y) (parent ?y ?x)))
((child ?x ?y) (parent ?y ?x))
eus$ (substitute-bindings
            (match-antecedent
                 rule '((parent donald nancy)
                        (male donald)
                        (female nancy)))
             rule)
((child nancy donald) (parent donald nancy))
```
```Lisp
$ rlwrap eus list-3-3-5.l
1.eus$ (defparameter *rules* nil)
nil
2.eus$ (<- (father ?x ?y) (and (parent ?x ?y) (male ?x)))
(((father ?x ?y) (and (parent ?x ?y) (male ?x))))
3.eus$ (<- (child ?x ?y) (parent ?y ?x))
(((child ?x ?y) (parent ?y ?x)) ((father ?x ?y) (and (parent ?x ?y) (male ?x))))
4.eus$ (<- (daughter ?x ?y) (and (child ?x ?y) (female ?x)))
(((daughter ?x ?y) (and (child ?x ?y) (female ?x))) ((child ?x ?y) (parent ?y ?x)) ((father ?x ?y) (and (parent ?x ?y) (male ?x))))
5.eus$ (setq *wmemory* '((parent donald nancy) (male donald) (female nancy)))
((parent donald nancy) (male donald) (female nancy))
6.eus$ (production-system '(daughter nancy donald))
rule1 : ((daughter ?x ?y) (and (child ?x ?y) (female ?x)))
rule2 : ((child ?x ?y) (parent ?y ?x))
rule3 : ((father ?x ?y) (and (parent ?x ?y) (male ?x)))
wm -> ((parent donald nancy) (male donald) (female nancy))
0: rule2 fired
wm -> ((child nancy donald) (parent donald nancy) (male donald) (female nancy))
Rule Interpreter Halted
Goal (daughter nancy donald) archived.
Here are contents of working memory:
((daughter nancy donald)
 (child nancy donald)
 (parent donald nancy)
 (male donald)
 (female nancy))
nil
```
```Lisp
$ rlwrap eus list-3-3-6.l
1.eus$ (setq *wmemory* '((parent donald nancy) (male donald) (female nancy)))
((parent donald nancy) (male donald) (female nancy))
2.eus$ (production-system '(daughter donald nancy))
rule1 : ((daughter ?y ?x) (and (child ?y ?x) (female ?y)))
rule2 : ((child ?x ?y) (parent ?y ?x))
rule3 : ((father ?x ?y) (and (parent ?x ?y) (male ?x)))
wm -> ((parent donald nancy) (male donald) (female nancy))
0: rule2 fired
wm -> ((child nancy donald) (parent donald nancy) (male donald) (female nancy))
1: rule1 fired
wm -> ((daughter nancy donald)
 (child nancy donald)
 (parent donald nancy)
 (male donald)
 (female nancy))
2: rule3 fired
wm -> ((father donald nancy)
 (daughter nancy donald)
 (child nancy donald)
 (parent donald nancy)
 (male donald)
 (female nancy))
Rule Interpreter Halted
No rules found.
Here are contents of working memory:
((father donald nancy)
 (daughter nancy donald)
 (child nancy donald)
 (parent donald nancy)
 (male donald)
 (female nancy))
nil
```
プロダクションシステムの応用例
```Lisp
$ rlwrap eus list-3-3-6.l
1.eus$ (defparameter *rules* nil)
nil
2.eus$ (<- (turn left) (and (obstacle front) (obstacle right)))
(((turn left) (and (obstacle front) (obstacle right))))
3.eus$ (<- (turn right) (and (obstacle front) (obstacle left)))
(((turn right) (and (obstacle front) (obstacle left))) ((turn left) (and (obstacle front) (obstacle right))))
4.eus$ (<- (go backward) (and (obstacle front) (obstacle right) (obstacle left)))
(((go backward) (and (obstacle front) (obstacle right) (obstacle left))) ((turn right) (and (obstacle front) (obstacle left))) ((turn left) (and (obstacle front) (obstacle right))))
5.eus$ (<- (go forward))
(((go forward) nil) ((go backward) (and (obstacle front) (obstacle right) (obstacle left))) ((turn right) (and (obstacle front) (obstacle left))) ((turn left) (and (obstacle front) (obstacle right))))
6.eus$ (setq *wmemory* '((obstacle front) (obstacle right) (obstacle left)))
((obstacle front) (obstacle right) (obstacle left))
7.eus$ (production-system nil)
rule1 : ((go forward) nil)
rule2 : ((go backward) (and (obstacle front) (obstacle right) (obstacle left)))
rule3 : ((turn right) (and (obstacle front) (obstacle left)))
rule4 : ((turn left) (and (obstacle front) (obstacle right)))
wm -> ((obstacle front) (obstacle right) (obstacle left))
0: rule3 fired
wm -> ((turn right) (obstacle front) (obstacle right) (obstacle left))
1: rule4 fired
wm -> ((turn left)
 (turn right)
 (obstacle front)
 (obstacle right)
 (obstacle left))
2: rule2 fired
wm -> ((go backward)
 (turn left)
 (turn right)
 (obstacle front)
 (obstacle right)
 (obstacle left))
Rule Interpreter Halted
No rules found.
Here are contents of working memory:
((go backward)
 (turn left)
 (turn right)
 (obstacle front)
 (obstacle right)
 (obstacle left))
nil
8.eus$ (production-system '(go forward))
rule1 : ((go forward) nil)
rule2 : ((go backward) (and (obstacle front) (obstacle right) (obstacle left)))
rule3 : ((turn right) (and (obstacle front) (obstacle left)))
rule4 : ((turn left) (and (obstacle front) (obstacle right)))
wm -> ((go backward) (turn left) (turn right) (obstacle front) (obstacle right) (obstacle left))
0: rule3 fired
wm -> ((turn right)
 (go backward)
 (turn left)
 (obstacle front)
 (obstacle right)
 (obstacle left))
1: rule4 fired
wm -> ((turn left)
 (turn right)
 (go backward)
 (obstacle front)
 (obstacle right)
 (obstacle left))
2: rule2 fired
wm -> ((go backward)
 (turn left)
 (turn right)
 (obstacle front)
 (obstacle right)
 (obstacle left))
Rule Interpreter Halted
No rules found.
Here are contents of working memory:
((go backward)
 (turn left)
 (turn right)
 (obstacle front)
 (obstacle right)
 (obstacle left))
nil
```

## マッチングを使った応用例
```Lisp
$ rlwrap eus list-3-4-1.l
1.eus$ (replcae-logic '(and (or a b) (not (and a b))))
(nand (nand (nand (nand a a) (nand b b)) (nand (nand (nand a b) (nand a b)) (nand (nand a b) (nand a b)))) (nand (nand (nand a a) (nand b b)) (nand (nand (nand a b) (nand a b)) (nand (nand a b) (nand a b)))))
2.eus$ (check-logic (replcae-logic '(and (or a b) (not (and a b)))))
a-b----
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 0
(nil nil nil nil)
3.eus$ (check-logic (replcae-logic '(and (or a b) (or (not a) (not b)))))
a-b----
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 0
(nil nil nil nil)
4.eus$ (check-logic (replcae-logic '(or (and a (not b)) (and (not a) b))))
a-b----
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 0
(nil nil nil nil)
5.eus$ (check-logic '(nand (nand a (nand a b)) (nand (nand a b) b)))
a-b----
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 0
(nil nil nil nil)
```
簡単な会話プログラム
```Lisp
$ rlwrap eus list-3-4-2.l
1.eus$ (pat-match '(?x want ?y) '(i want to test this program))
((?y to test this program) (?x i))
```
人工知能プログラム Eliza
```Lisp
$ rlwrap eus list-3-4-4.l
1.eus$ eliza
eliza>(hello)
(how do you please stats your problem.)
eliza>(i want to test this program)
(why do you want to test this program)
eliza>(i could see if it works)
(really-- if it works)
eliza>(no not really)
(why not?)
eliza>(no)
(are you saying no just to be negative)
eliza>(no)
(you are being a bit negative)
eliza>(foreget it-- i was wondering how general the program is)
(what do you tell me you were wondering how general the program is now?)
eliza>(i felt like it)
(what other feelings do you have?)
eliza>(i feel this is enough)
(do you often fell this is enough ?)
```

## 後ろ向き推論
変数を含むパターン同士のマッチング
```Lisp
$ rlwrap eus list-3-5-2.l
1.eus$ (match '(?x b c) '(a b c))
((?x . a))
2.eus$ (match '(?x a) '(a ?x))
fail
```
Unify関数の構造
```Lisp
$ rlwrap eus list-3-5-3.l
1.eus$ (unify '(?x a) '(a ?x))
((?x . a))
2.eus$ (unify '(?x a a) '(?y a ?y))
((?y . a) (?x . ?y))
3.eus$ (unify '(?x a b ?x) '((?y) a ?y (b)))
((?y . b) (?x ?y))
```

バインディングの再帰的呼び出し
```Lisp
$ rlwrap eus list-3-5-4.l
1.eus$ (unify '(?x a a) '(?y a ?y))
((?y . a) (?x . ?y))
2.eus$ (get-binding '?x '((?y . a) (?x . ?y)))
a
3.eus$ (unify '(?x a b ?x) '((?y) a ?y (b)))
((?y . b) (?x ?y))
4.eus$ (get-binding '?x '((?y . b) (?x ?y)))
(?y)
```

同一変数のバインディング
```Lisp
$ rlwrap eus list-3-5-5.l
1.eus$ (unify '(?x ?x ?x) '(?y ?y ?y))
((?x . ?y))
```

Unifyの応用例
```Lisp
$ rlwrap eus list-3-5-6.l
1.eus$ (unifier '(?x ?y a) '(?y ?x ?x))
(a a a)
2.eus$ (unifier '((?a * ?x ^2 ) + (?b * ?x) + ?c) '(?z + (4 * 5) + 3))
((?a * 5 ^2) + (4 * 5) + 3)
```

ルールの定義
```Lisp
$ rlwrap eus list-3-5-8.l
1.eus$ (<- (parent donald nancy))
1
2.eus$ (<- (child ?x ?y) (parent ?y ?x))
1
```

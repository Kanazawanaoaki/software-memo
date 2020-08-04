# prolog
宣言型プログラミングの例として，論理プログララミング言語Prologを使う．  

## 事実の記述
```
$ prolog -f like.pl
```
```prolog
?- [like].
?- listing.
```
```prolog
?- like(taro,coffee).
true .

?- like(hanako,coffee).
false.

?- like(hanako,tea).
true.

?- like(taro,X).
X = coffee ;
X = cocoa.

?- like(X,Y).
X = taro,
Y = coffee ;
X = hanako,
Y = tea ;
X = taro,
Y = cocoa.
```
```prolog
?- halt.
```

## 規則の記述
```prolog
$ prolog -f like2.pl
?- fly(jet_plane).
true .

?- fly(taro).
true.

?- fly(Y).
Y = jet_plane ;
Y = helicopter ;
Y = taro.
```

## リスト操作
```prolog
?- my_append([a,b,c],[d,e,f],Z).
Z = [a, b, c, d, e, f].

?- my_append(Z,[c,d],[a,b,c,d]).
Z = [a, b] ;
false.

?- my_append(X,Y,[a,b,c,d]).
X = [],
Y = [a, b, c, d] ;
X = [a],
Y = [b, c, d] ;
X = [a, b],
Y = [c, d] ;
X = [a, b, c],
Y = [d] ;
X = [a, b, c, d],
Y = [] ;
false.
```

## 応用問題

### 8クイーン
```prolog
?- X is 1 + 2.
X = 3.

?- 1 =:= 1.
true.

?- 1 =:= 2.
false.
```

### 4色問題
```prolog
?- map(Solution, [red, blue]).
false.

?- map(Solution, [red, blue, yellow]).
```

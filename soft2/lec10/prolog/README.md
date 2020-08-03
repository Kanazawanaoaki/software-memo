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

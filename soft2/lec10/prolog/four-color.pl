map([A,B,C,D,E,F], Colors) :-
		next(A,B, Colors), next(A,C, Colors), next(A,D, Colors),
		next(B,C, Colors), next(C,D, Colors),
		next(B,E, Colors), next(C,E, Colors), next(C,F, Colors).

next(X, Y, Colors) :- %% two adjacent regions are colored differently
		member(X, Colors),
		member(Y, Colors),
		not(X == Y).

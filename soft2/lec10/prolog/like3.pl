my_append([], Xs, Xs).
my_append([X | Ls], Ys, [X | Zs]) :- my_append(Ls, Ys, Zs).

% ===== Simpsons Family Tree =====

%==Facts==
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).

%==Rules==
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).
aunt(X, Y) :- parent(P, Y), sister(X, P).
uncle(X, Y) :- parent(P, Y), brother(X, P).
cousin(X, Y) :- parent(P1, X), parent(P2, Y), ( sister(P1, P2) ; brother(P1, P2) ).
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).




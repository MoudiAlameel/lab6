% FACTS

% Male facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female facts
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).
parent(selma, ling).

% RULES

father(F, C) :- parent(F, C), male(F).

mother(M, C) :- parent(M, C), female(M).

son(S, P) :- parent(P, S), male(S).

daughter(D, P) :- parent(P, D), female(D).

brother(B, Sibling) :- 
    parent(P, B), 
    parent(P, Sibling), 
    male(B), 
    B \= Sibling.

sister(S, Sibling) :- 
    parent(P, S), 
    parent(P, Sibling), 
    female(S), 
    S \= Sibling.

grandfather(GF, GC) :- 
    father(GF, P), 
    parent(P, GC).

aunt(A, N) :- 
    sister(A, P), 
    parent(P, N).

uncle(U, N) :- 
    brother(U, P), 
    parent(P, N).

cousin(C1, C2) :- 
    parent(P1, C1), 
    parent(P2, C2), 
    parent(GP, P1), 
    parent(GP, P2), 
    P1 \= P2.

% Base case for ancestor
ancestor(A, D) :- parent(A, D).
% Recursive case for ancestor
ancestor(A, D) :- parent(A, X), ancestor(X, D).

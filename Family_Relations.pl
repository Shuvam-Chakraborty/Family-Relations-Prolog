:- use_module(library(lists)).

/*
Harry Potter X Tarantino Family Tree:

First Generation
Arthur (m) married Molly (f)
Children: Bill, Percy, George, Ron, Ginny, Laralee

Second Generation
Bill (m) married Fleur (f)
Children: Victoire, Dominique, Louis
Percy (m) married Audrey (f)
Children: Lucy, Molly II
George (m) married Angelina (f)
Children: Fred II, Roxanne
Ron (m) married Hermione (f)
Children: Hugo, Rose
Ginny (f) married Harry (m)
Children: James Sirius, Albus Severus, Lily Luna
Laralee (f) married Rick (m)
Children: Jay, Marvin

Third Generation
Victoire (f) married Usher (m)
Dominique (f) married Kevin (m)
Louis (m) married Lauren (f)
Lucy (f) married Peter (m)
Molly II (f) married Bob (m)
Fred II (m) married Broomhilda (f)
Roxanne (f) married Calvin (m)
Hugo (m) married Soshanna (f)
Rose (f) married Django (m)
James Sirius (m) married Alice (f)
Albus Severus (m) married Jasmine (f)
Lily Luna (f) married Sam (m)
Jay (m) married Sadie (f)
*/

% Basic facts
% All male
male(arthur).
male(bill).
male(percy).
male(george).
male(ron).
male(harry).
male(rick).
male(usher).
male(kevin).
male(louis).
male(peter).
male(bob).
male(fred_ii).
male(calvin).
male(hugo).
male(django).
male(james_sirius).
male(albus_severus).
male(sam).
male(jay).
male(marvin).

% All feamle
female(molly).
female(fleur).
female(audrey).
female(angelina).
female(hermione).
female(ginny).
female(laralee).
female(victoire).
female(dominique).
female(lauren).
female(lucy).
female(molly_ii).
female(broomhilda).
female(roxanne).
female(soshanna).
female(rose).
female(alice).
female(jasmine).
female(lily_luna).
female(sadie).

% Parent-child relationships
% child(X,Y) means X is the child of Y

% 2nd generation
child(bill, molly).
child(bill, arthur).
child(percy, molly).
child(percy, arthur).
child(george, molly).
child(george, arthur).
child(ron, molly).
child(ron, arthur).
child(ginny, molly).
child(ginny, arthur).
child(laralee, molly).
child(laralee, arthur).

% 3rd generation
child(victoire, fleur).
child(victoire, bill).
child(dominique, fleur).
child(dominique, bill).
child(louis, fleur).
child(louis, bill).

child(lucy, audrey).
child(lucy, percy).
child(molly_ii, audrey).
child(molly_ii, percy).

child(fred_ii, angelina).
child(fred_ii, george).
child(roxanne, angelina).
child(roxanne, george).

child(hugo, hermione).
child(hugo, ron).
child(rose, hermione).
child(rose, ron).

child(james_sirius, ginny).
child(james_sirius, harry).
child(albus_severus, ginny).
child(albus_severus, harry).
child(lily_luna, ginny).
child(lily_luna, harry).

child(jay, laralee).
child(jay, rick).
child(marvin, laralee).
child(marvin, rick).

% Marriages
% married(X,Y) X is married to Y
married(arthur, molly).
married(molly, arthur).
married(bill, fleur).
married(fleur, bill).
married(percy, audrey).
married(audrey, percy).
married(george, angelina).
married(angelina, george).
married(ron, hermione).
married(hermione, ron).
married(harry, ginny).
married(ginny, harry).
married(rick, laralee).
married(laralee, rick).
married(usher, victorie).
married(victorie, usher).
married(kevin, dominique).
married(dominique, kevin).
married(louis, lauren).
married(lauren, louis).
married(peter, lucy).
married(lucy, peter).
married(bob, molly_ii).
married(molly_ii, bob).
married(fred_ii, broomhilda).
married(broomhilda, fred_ii).
married(calvin, roxanne).
married(roxanne, calvin).
married(hugo, soshanna).
married(soshanna, hugo).
married(django, rose).
married(rose, django).
married(james_sirius, alice).
married(alice, james_sirius).
married(albus_severus, jasmine).
married(jasmine, albus_severus).
married(sam, lily_luna).
married(lily_luna, sam).
married(jay, sadie).
married(sadie, jay).

% Relationships
% Grandfather
% grandfather(X) returns who is the grandfather of X
grandfather(X) :-
    child(X,P), child(P,GP), male(GP),
    write(GP), write(' is the grandfather of '), write(X), nl.

% Grandmother
% grandmother(X) returns who is the grandmother of X
grandmother(X) :-
    child(X,P), child(P,GP), female(GP),
    write(GP), write(' is the grandmother of '), write(X), nl.

% Grandparents
% grandparent(X) returns who are the grandparents of X
grandparent(X) :-
    child(X,P), child(P,GP),
    write(GP), write(' is the grandparent of '), write(X), nl.

% Father
% father(X) returns who is the father of X
father(X) :-
    child(X,P), male(P),
    write(P), write(' is the father of '), write(X), nl.

% Mother
% mother(X) returns who is the mother of X
mother(X) :-
    child(X,P), female(P),
    write(P), write(' is the mother of '), write(X), nl.

% Parent
% parent(X) returns who are the parents of X
parent(X) :-
    child(X,P),
    write(P), write(' is the parent of '), write(X), nl.

% Grandson
% grandson(X) returns who is the grandson of X
grandson(X) :-
    child(C,X), child(GC,C), male(GC),
    write(GC), write(' is the grandson of '), write(X), nl.

% Granddaughter
% granddaughter(X) returns who is the granddaughter if X
granddaughter(X) :-
    child(C,X), child(GC,C), female(GC),
    write(GC), write(' is the granddaughter of '), write(X), nl.

% Grandchildren
% grandchildren(X) returns who are the grandchildren of X
grandchildren(X) :-
    child(C,X), child(GC,C),
    write(GC), write(' is the grandchild of '), write(X), nl.

% Son
% son(X) returns who is/are the son(s) of X
son(X) :-
    child(C,X), male(C),
    write(C), write(' is the son of '), write(X), nl.

% Daughter
% daughter(X) returns who is/are the daughter(s) of X
daughter(X) :-
    child(C,X), female(C),
    write(C), write(' is the daughter of '), write(X), nl.

% Children
% children(X) returns who is/are the children of X
children(X) :-
    child(C,X),
    write(C), write(' is the child of '), write(X), nl.

% Brother
% brother(X) returns who are the brothers of X
brother(X) :-
	child(X,P), child(Y,P), male(Y),  female(P), \+(X=Y),
    write(Y), write(' is the brother of '), write(X), nl.

% Sister
% sister(X) returns who are the sisters of X
sister(X) :-
	child(X,P), child(Y,P), female(Y),  female(P), \+(X=Y),
    write(Y), write(' is the sister of '), write(X), nl.

% Cousin
% cousin(X) returns who are the cousins of X
cousin(X) :-
    child(X, P), child(P,GP), child(UA,GP), female(GP), \+(P=UA), child(C,UA),
    write(C), write(' is the cousin of '), write(X), nl.

% Husband
% husband(X) returns who is the husband of X
husband(X) :-
    married(Y, X), female(X), male(Y),
    write(Y), write(' is the husband of '), write(X), nl.

% Wife
% wife(Y) returns who is the wife of Y
wife(Y) :-
    married(Y, X), female(X), male(Y),
    write(X), write(' is the wife of '), write(Y), nl.

% Uncle
% uncle(X) returns who are the uncles of X
uncle(X) :-
    (child(X,P), child(P,GP), child(U,GP), male(U), female(GP), \+(P=U),
    write(U), write(' is the uncle of '), write(X), nl);
    (child(X,P), child(P,GP), child(A,GP), female(A), female(GP), married(U,A), male(U), \+(P=A),
    write(U), write(' is the uncle of '), write(X), nl).

% Aunt
% aunt(X) returns who are the aunts of X
aunt(X) :-
    (child(X,P), child(P,GP), child(A,GP), female(A),  female(GP), \+(P=A),
    write(A), write(' is the aunt of '), write(X), nl);
    (child(X,P), child(P,GP), child(U,GP), male(U),  female(GP), married(U,A), female(A), \+(P=U),
    write(A), write(' is the aunt of '), write(X), nl).

% Nephew
% nephew(X) returns who are the nephews of X
nephew(X) :-
    (child(X,P), female(P), child(Y,P), \+(Y=X), child(N,Y), male(N),
    write(N), write(' is the nephew of '), write(X), nl);
    (married(X,S), child(S,P), female(P), child(Y,P), \+(Y=S), child(N,Y), male(N),
    write(N), write(' is the nephew of '), write(X), nl).

% Niece
% niece(X) returns who are the niece of X
niece(X) :-
    (child(X,P), female(P), child(Y,P), \+(Y=X), child(N,Y), female(N),
    write(N), write(' is the niece of '), write(X), nl);
    (married(X,S), child(S,P), female(P), child(Y,P), \+(Y=S), child(N,Y), female(N),
    write(N), write(' is the niece of '), write(X), nl).

% Mother-in-law
% mother_in_law(X) returns who is the mother-in-law of X
mother_in_law(X) :-
    (female(X), married(H,X), male(H), child(H,IL), female(IL),
    write(IL), write(' is the mother-in-law of '), write(X), nl);
    (male(X), married(X,W), child(W,IL), female(W), female(IL),
    write(IL), write(' is the mother-in-law of '), write(X), nl).

% Father-in-law
% father_in_law(X) returns who is the father-in-law of X
father_in_law(X) :-
    (female(X), married(H,X), child(H,IL), male(H), male(IL),
    write(IL), write(' is the father-in-law of '), write(X), nl);
    (male(X), married(X,W), child(W,IL), female(W), male(IL),
    write(IL), write(' is the father-in-law of '), write(X), nl).

% Son-in-law
% son_in_law(X) returns who is the son-in-law of X
son_in_law(X) :-
    child(C,X), female(C), married(H,C), male(H),
    write(H), write(' is the son-in-law of '), write(X), nl.

% Daughter-in-law
% daugher_in_law(X) returns who is the daughter-in-law of X
daughter_in_law(X) :-
    child(C,X), male(C), married(C,W), female(W),
    write(W), write(' is the daughter-in-law of '), write(X), nl.

% Brother-in-law
% brother_in_law(X) returns who is the brother-in-law of X
brother_in_law(X) :-
    (male(X), married(X,W), female(W), child(W,P), female(P), child(B,P), male(B), \+(B=W),
    write(B), write(' is the brother-in-law of '), write(X), nl);
    (male(X), child(X,P), female(P), child(S,P), female(S), \+(S=X), married(S,H), male(H),
    write(H), write(' is the brother-in-law of '), write(X), nl);
    (female(X), married(X,H), male(H), child(H,P), female(P), child(B,P), male(B), \+(B=H),
    write(B), write(' is the brother-in-law of '), write(X), nl);
    (female(X), married(X,H), male(H), child(H,P), female(P), child(S,P), female(S), \+(S=H), married(S,B), male(B),
    write(B), write(' is the brother-in-law of '), write(X), nl).

% Sister-in-law
% sister_in_law(X) returns who is the sister-in-law of X
sister_in_law(X) :-
    (male(X), married(X,W), female(W), child(W,P), female(P), child(S,P), female(S), \+(S=W),
    write(S), write(' is the sister-in-law of '), write(X), nl);
    (male(X), child(X,P), female(P), child(B,P), male(B), \+(B=X), married(B,W), female(W),
    write(W), write(' is the sister-in-law of '), write(X), nl);
    (male(X), married(X,W), female(W), child(W,P), female(P), child(B,P), male(B), \+(B=W), married(B,S), female(S),
    write(S), write(' is the sister-in-law of '), write(X), nl);
    (female(X), married(X,H), male(H), child(H,P), female(P), child(S,P), female(S), \+(S=H),
    write(S), write(' is the sister-in-law of '), write(X), nl);
    (female(X), married(X,H), male(H), child(H,P), female(P), child(B,P), male(B), \+(B=H), married(B,W), female(W),
    write(W), write(' is the sister-in-law of '), write(X), nl);
    (female(X), child(X,P), female(P), child(B,P), male(B), \+(B=X), married(B,W), female(W),
    write(W), write(' is the sister-in-law of '), write(X), nl).
    



% Sample test cases

% male(harry).
% female(harry).
% child(dominique, bill).
% married(ron, ginny).
% grandfather(fred_ii).
% grandmother(fred_ii).
% grandparent(fred_ii).
% father(fred_ii).
% mother(fred_ii).
% parent(fred_ii).
% grandson(arthur).
% granddaughter(arthur).
% grandchildren(arthur).
% son(harry).
% daughter(harry).
% children(ginny).
% brother(ron).
% sister(louis).
% cousin(dominique).
% uncle(hugo).
% aunt(lucy).
% nephew(ron).
% niece(ron).
% husband(hermione).
% wife(arthur).
% mother_in_law(hermione).
% father_in_law(harry).
% son_in_law(arthur).
% daughter_in_law(molly).
% brother_in_law(harry).
% sister_in_law(hermione).
% aunt(X).
% niece(X).
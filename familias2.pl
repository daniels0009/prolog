hombre(pedro).
hombre(andres).
hombre(jose).
hombre(juan).
hombre(luis).
hombre(manuel).
hombre(carlos).
hombre(hector).
hombre(jaime).
hombre(oscar).
mujer(camila).
mujer(ana).
mujer(angelica).
mujer(maria).
mujer(laura).
mujer(silvia).
mujer(tata).
mujer(angie).
mujer(luisa).
mujer(sofia).
mujer(diana).

progenitor(juan,carlos).
progenitor(juan,camila).
progenitor(juan,sebastian).
progenitor(maria,carlos).
progenitor(maria,camila).
progenitor(maria,sebastian).
progenitor(carlos,pedro).
progenitor(carlos,laura).
progenitor(ana,pedro).
progenitor(ana,laura).
progenitor(sebastian,andres).
progenitor(angelica,andres).
progenitor(jose,luis).
progenitor(jose,manuel).
progenitor(camila,luis).
progenitor(camila,manuel).
progenitor(pedro,jaime).
progenitor(pedro,diana).
progenitor(silvia,jaime).
progenitor(silvia,diana).
progenitor(laura,hector).
progenitor(sofia,hector).
progenitor(andres,oscar).
progenitor(tata,oscar).
#suegro, cuñado, suegra, esposo, esposa, esfeliz

pareja(X,Y) :- progenitor(X,Z),progenitor(Y,Z),X \== Y.
padre(X,Y):- hombre(X),progenitor(X,Y).
madre(X,Y):- mujer(X),progenitor(X,Y).
adoptado(A) :- progenitor(X,A),hombre(X),hombre(Y),pareja(X,Y).
adoptado(A) :- progenitor(X,A),mujer(X),mujer(Y),pareja(X,Y).
abuelo(X,Y) :- progenitor(X,Z) , progenitor(Z,Y).
bisabuelo(X,Y) :- progenitor(X,Z), abuelo(Z,Y).
bisnieto(X,Y) :- progenitor(Y,Z),abuelo(Z,X).
nieto(X,Y) :- progenitor(Y,Z),progenitor(Z,X).
hermano(X,Y) :- progenitor(Z,X),progenitor(Z,Y),X \== Y.
tio(X,Y) :- progenitor(Z,Y),hermano(Z,X).
cuñado(X,Y) :- hermano(X,Z),pareja(Z,Y).
sobrino(X,Y):-progenitor(Z,X),hermano(Z,Y).
suegrode(X,Y):- esposode(X,Z), hijode(Y,Z).
cuñadode(X,Y):- hermanode(Y,Z), esposode(X,Z).
esfeliz(X):- not(esposode(_,X)).






















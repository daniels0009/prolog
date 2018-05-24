profesorContrato(alejandro,tco).
profesorContrato(carlos,tco).
profesorContrato(andrea,hc).
profesorContrato(pedro,hc).
profesorContrato(juan,hch).
profesorContrato(oscar,hch).
profesorContrato(miguel,mto).
profesorContrato(gabriel,mto).
profesorContrato(luisa,planta).
profesorContrato(ana,planta).

cargo(alejandro,titular).
cargo(carlos,asistente).
cargo(pedro,asistente).
cargo(andrea,titular).
cargo(juan,asistente).
cargo(oscar,titular).
cargo(miguel,titular).
cargo(gabriel,asistente).
cargo(luisa,asistente).
cargo(ana,titular).

horaSemana(tco,40).
horaSemana(hc,16).
horaSemana(mto,20).
horaSemana(hch,8).
horaSemana(planta,40).

costoHora(tco,asistente,10000).
costoHora(tco,titular,50000).
costoHora(mto,asistente,9000).
costoHora(mto,titular,40000).
costoHora(hch,asistente,7000).
costoHora(hch,titular,25000).
costoHora(hc,asistente,8000).
costoHora(hc,titular,30000).
costoHora(planta,asistente,20000).
costoHora(planta,titular,100000).

duracionSemestre(18,normal).
duracionSemestre(4,vacacional).

porcentajeAdicional(tco,15).
porcentajeAdicional(mto,12).
porcentajeAdicional(hc,10).
porcentajeAdicional(planta,25).

valorSemana(A,C):-profesorContrato(A,X),cargo(A,Y),costoHora(X,Y,D),horaSemana(X,Z), C is D*Z.

valorSemestre(A,B,C):- duracionSemestre(X,B),valorSemana(A,Y),profesorContrato(A,Z),porcentajeAdicional(Z,D), C is (X*Y)*(1+(D/100)).


sumaNomina([], S, S).
sumaNomina([X|Xs], T, S):- T2 is T + X,sumaNomina(Xs, T2, S).

nomina(V,T):- findall(S,valorSemestre(_,T,S),S),sumaNomina(S,0,V).















































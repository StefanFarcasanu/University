% adaugaFinal - rolul acesteia este de a adauga la finalul unei liste un
%              element primit ca si parametru
% adaugaFinal(l1,l2,..,ln,E)= { [E]                             , n = 0
%                             { l1 + adaugaFinal(l2,l3,...,ln,E), altfel
%
% adaugaFinal(L:list, E:element, O:list)
% modelul de flux(i,i,o)

adaugaFinal([], E, [E]). % ramura 1
adaugaFinal([H|T], E, [H|O]):-adaugaFinal(T,E,O). % ramura 2

% inverseazaLista - rolul acesteia este de a inversa o lista de numere
% inverseazaLista(l1,l2,...,ln)={ [], n = 0
%                               { inverseazaLista(l2,...,ln) + l1,altfel
%
% inverseazaLista(L:list, O:list)
% modelul de flux(i,o)

inverseazaLista([],[]). %ramura 1
inverseazaLista([H|T], O):-inverseazaLista(T,L),
                           adaugaFinal(L, H, O). % ramura 2

% listaToNumar - rolul acesteia este de a converti o lista de numere
%                intr-un numar, aceasta fiind trimisa inversata
% listaToNumar(l1,l2,...,ln,putere) = { l1 * putere , n = 1
%                                     {
%                                l1*putere+listaToNumar(l2,.,ln,putere*10),altfel
%
% listaToNumar(L:list(int*), O:int, p:int)
% L trebuie sa contina cel putin un element
% modelul de flux(i,o,i)

listaToNumar([C],O,P):-O is C * P. % ramura 1
listaToNumar([H|T],O,P):-H1 is H * P,
                         P1 is P * 10,
                         listaToNumar(T, O1, P1), %ramura 2
                         O is O1 + H1.

% Functia listaToNumarMain apeleaza listaToNumar
% listaToNumarMain(L:list, O:int)
% modelul de flux(i,o)
listaToNumarMain(L,O):-listaToNumar(L,O,1).

% numarToLista - rolul acesteia este de a converti un numar intr-o lista
%                de cifre
% numarToLista(nr) = { [nr]                            , nr < 10
%                    { numarToLista(nr/10) + [nr % 10] , altfel
%
% numarToLista(nr:int, O:list)
% modelul de flux(i,o)

numarToLista(C, [C]):- C < 10. % ramura 1
numarToLista(N, O1):-N >= 10,
                     C is N mod 10,
                     N1 is N div 10,
                     numarToLista(N1, O),
                     adaugaFinal(O,C,O1). % ramura 2

% suma - rolul acesteia este de a calcula suma a 2 numere ce sunt
%        reprezentate cu ajutorul a 2 liste
%
% suma(L1,L2) = numarToLista(listaToNumarMain(inverseazaLista(L1)) +
%                            listaToNumarMain(inverseazaLista(L2)))
%
% suma(l1:list, l2:list)
% modelul de flux(i,i,o)

suma([], [], [0]).
suma([C],[], [C]).
suma([],[C], [C]).
suma(L1,L2,O):- inverseazaLista(L1,OL1),
                inverseazaLista(L2,OL2),
                listaToNumarMain(OL1,N1),
                listaToNumarMain(OL2,N2),
                N is N1 + N2,
                numarToLista(N, O).


% sumaLista - rolul acesteia este de a calcula suma numerelor
%             reprezentate sub forma de lista
% sumaLista(l1,l2,...,ln) = { [0], n = 0
%                           {suma(l1,sumaLista(l2,...,ln)),l1 e list
%                           {sumaLista(l2,...,ln), altfel
% sumaLista(l1:list, s:list)
% modelul de flux(i,o)
% Toate modelele de aici sunt deterministe

sumaLista([],[0]). %ramura 1
sumaLista([H|T], S):-is_list(H),
                     !,
                     sumaLista(T,S1),%ramura 2
                     suma(S1, H, S).
sumaLista([_|T], S):-sumaLista(T,S).%ramura 3

test:- sumaLista([1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0],6],[8,2,2]),
       sumaLista([1,[2,3]],[2,3]),
       sumaLista([1,0],[0]),
       sumaLista([[1],[2],[3]],[6]).


% Test 1: sumaLista([1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0],
% 6],[8,2,2]).
% Test 2: sumaLista([1,[2,3]],[2,3]).
% Test 3: sumaLista([1,0],[0]).
% Test 4: sumaLista([[1],[2],[3]],[6]).

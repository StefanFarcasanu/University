% prime - rolul acestei functii este de a verifica daca un numar
%        este prim sau nu, acesta fiind trimis ca si parametru
% prime(n, div) = {      false            , n < 2
%                 {      true             , n == 2
%                 {      false            , n % 2 == 0 si n > 2
%                 {      true             , n > 2, n%2!=0, div * div > n
%                 {      false       , n % div == 0, n % 2 != 0 si n > 2
%                 {      prime(n, div + 2), altfel
%
% prime(N:Int, div:Int)
% model de flux(i, i), determinist
prime(N, _):- N < 2,
              !,
              fail.
prime(N, _):- N =:= 2,
              !.
prime(N, _):- R is N mod 2,
              R =:= 0,
              !,
              fail.
prime(N, DIV):- DIV * DIV > N,
                !.
prime(N, DIV):- R is N mod DIV,
                R =:= 0,
                !,
                fail.
prime(N, DIV):- DIV1 is DIV + 2,
                prime(N, DIV1).

isPrime(N):-prime(N, 3).

% sirNrPrime(n) - rolul acestei functii este de a genera sirul de
%                 numere prime mai mici decat n
% sirNrPrime(n, limit) = {     []                    , n = limit
%                        { n + sirNrPrime(n+1,limit) , isPrime(n) =true
%                        { sirNrPrime(l2,...,ln)     , altfel
% sirNrPrime(N:Int, L:Int, O: List)
% model de flux (i, i, o),determinist
% model de flux (i, i, i), determinist
sirNrPrime(N,N,[]):-!.
sirNrPrime(N,L,[N|O]):-isPrime(N),
                       %isPrimeV2(N), %merge cu ambele functii
                       !,%TAIETURA ROSIE, OPRESETE APARITIA DE SOLUTII ERONATE
                       N1 is N + 1,
                       sirNrPrime(N1, L, O).
sirNrPrime(N,L,O):-N1 is N + 1,
                   sirNrPrime(N1, L, O).

% candidat(l) - returneaza un posibil candidat pentru solutie
% candidat(l1,...,ln) =  1   l1                  , n != 0
%                        2  candidat(l2,...,ln)  , n > 1
% candidat(L:List, E:int)
% model de flux (i, o), nedeterminist
candidat([E|_], E).
candidat([_|T], E):-candidat(T,E).

% solutie(L, N) - returneaza cate o solutie ce incepe cu un candidat
% solutie(L, N) = solutie_aux(L, N, [candidat(L)], candidat(L))
% solutie(L: List, N: Int, REZ: List)
% model de flux(i,i,o), nedeterminist
solutie(L, N, REZ):- candidat(L, E),
                     E < N,
                     solutie_aux(L, N, REZ, [E], E).

% solutie_aux(L, N, COL, S) - se ocupa cu cautarea tuturor solutiilor ce
%                         incep cu candidatul trimis din functia solutie
% solutie_aux(L, N, COL, S)={     COL     , S = N
%                           {solutie_aux(L,N,E(+)COL, E+S),
%                           { E = candidat(L) si E < COL1 si E + S < N
% solutie_aux(L:list, N:Int, REZ: List, COL:List, S:Int)
% Rez - rezultatul
% Rez - solutia
% S -suma curenta
% Col - colectoarea
% model de flux(i, i, o, i, i), nedeterminist
solutie_aux(_, N, REZ, REZ, N):-!. % taietura e pusa pentru a nu se mai continua
                                   % cautarea altei solutii deoarece am gasit una                                        % deja
solutie_aux(L, N, REZ, [H|COL], S):-candidat(L, E), % poate facem o fct conditie
                                    E < H,
                                    S1 is S + E,
                                    S1 =< N,
                                    solutie_aux(L, N, REZ, [E|[H|COL]],S1).

% rezolva(N) - se ocupa cu rezolvarea problemei noastre
% rezolva(N) = {        []                            , daca N = 1
%              { U(solutie(sirNrPrime(2,N), N)) , altfel
% model de flux(i,o), determinist
% model de flux(i,i), determinist
rezolva(1,[]):-!.
rezolva(N, O):- sirNrPrime(2, N, L),
                findall(O1, solutie(L, N, O1),O).

test:-rezolva(11,[]),
      rezolva(20,[[2, 7, 11], [2, 5, 13], [7, 13], [3, 17]]),
      rezolva(5,[[2,3]]),
      rezolva(30,[[2, 3, 5, 7, 13], [2, 11, 17], [13, 17], [11, 19], [2, 5, 23], [7, 23]]),
      rezolva(1,[]).
% isPrimeAux(N, DIV) - verifica daca numarul nostru >=9 este prim sau nu
% isPrimeAux(N, DIV) = {   false, N % DIV = 0 si DIV * DIV <= n
%                      {   isPrimeAux(N,DIV+2), DIV*DIV <= n si N%DIV!=0
%                      {   true, altfel(div*div > n)
% model de flux(i,i), determinist
isPrimeAux(N, DIV):-DIV * DIV > N,
                    !.
isPrimeAux(N, DIV):-DIV * DIV =< N,
                    N mod DIV =\= 0,
                    DIV1 is DIV + 2,
                    isPrimeAux(N, DIV1).

% isPrimeV2(N) - verifica daca numarul nostru este prim sau nu
% isPrimeV2(N) = { false, n < 2
%                { true,  n = 2
%                { false, n > 2 si n % 2 == 0
%                { true, n % 2 != 0 si 2<n si n<9
%                { isPrimeAux(n, 3), n%2!=0 si n >= 9
% model de flux(i), determinist
isPrimeV2(2):-!.
isPrimeV2(N):-N mod 2 =\= 0,
              N > 2,
              N < 9,
              !.
isPrimeV2(N):-N mod 2 =\= 0,
              N >= 9,
              isPrimeAux(N, 3).



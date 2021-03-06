% descompune(L, LP, LI, CTP, CTI) - functia ce se ocupa cu descompunerea
%                                   listei in lista de numere pare
%                                   si impare si returnarea ct de numere
%                                   pare si impare
% descompune(l1,...,ln,LP,LI,CTP,CTI) = { [LP + LI], n = 0
%         {descompune(l2,...,ln,l1+LP,LI,CTP+1,CTI), n > 0 si l1 % 2 = 0
%         {descompune(l2,...,ln,LP,l1+LI,CTP,CTI+1), altfel
% model de flux(i,i,i,i,i,o,o,o), determinist
% ramura 1
descompune([], LP, LI, CTP, CTI, [LP, LI], RP, RI):-RP is CTP,
                                                    RI is CTI.
%ramura 2
descompune([H|T], LP, LI, CTP, CTI, O, RP, RI):-mod(H,2) =:= 0,
                                       CTP1 is CTP + 1,
                                       descompune(T, [H|LP], LI, CTP1, CTI, O, RP, RI).
%ramura 3
descompune([H|T], LP, LI, CTP, CTI, O, RP, RI):-mod(H,2) =:= 1,
                                       CTI1 is CTI + 1,
                                       descompune(T, LP, [H|LI], CTP, CTI1, O, RP, RI).
% descompune_main(L, CTP, CTI) - functia ce apeleaza functia descompune
%                                care ne rezolva problema
% descompune_main(L, CTP, CTI) = descompune(L, [], [], 0, 0, CTP, CTI)
% model de flux(i, o, o, o), determinist
descompune_main(H, O, CTP, CTI):-descompune(H, [], [], 0, 0, O, CTP, CTI).

test:-descompune_main([1,2,3,4],[[4,2],[3,1]],2,2),
      descompune_main([2,2,4,4],[[4,4,2,2],[]],4,0),
      descompune_main([1,2],[[2],[1]],1,1),
      descompune_main([],[[],[]],0,0).

%Test 1: descompune_main([1,2,3,4],[[4,2],[3,1]],2,2).
%Test 2: descompune_main([2,2,4,4],[[4,4,2,2],[]],4,0).
%Test 3: descompune_main([1,2],[[2],[1]],1,1).
%Test 4: descompune_main([],[[],[]],0,0).

-module(ruz_exer05).
-export([factors/1, safety/0]).

factors(1) -> 										% base case for recursion
	Factor_List = [],
	N_factors  = Factor_List ++ 1,
	io:format("factors: ~p~n", [N_factors]);		% use ~p to automagically print the list. Or anything. 

factors(N) ->										% print a list of all the factors of N
	Factor_List = [],
	N_factors = [],
	Remainder = N rem (N-1),						    % find the remainder to determine if the value in 

	io:format("N = ~p, (N-1) = ~p, Remainder: ~p~n", [N, N-1, Remainder]),
	if
		Remainder == 0 ->
			io:format("here~n"),
			N_factors = Factor_List ++ (N-1),
			factors(N-1);
		Remainder =/= 0 ->
			io:format("then here~n"),
			factors(N-1)
	end.


safety()->
	io:format("wag ibenta ang bayan bc u aint a pussy like aguinaldo.~n").
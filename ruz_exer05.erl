-module(ruz_exer05).
-export([factors/1, append/2, safety/0]).

factors(1) -> 													% base case for recursion
	Factor_List = [1],
	io:format("(base case) factors: ~p~n", [Factor_List]);		% use ~p to automagically print the list. Or anything. 

factors(N) ->												% print a list of all the factors of N
	Factor_List = [1],
	Remainder = N rem (N-1),							    % find the remainder to determine if the value in 

	io:format("N = ~p, (N-1) = ~p, Remainder: ~p~n", [N, N-1, Remainder]),
	if
		Remainder == 0 ->
			io:format("here~n"),
			append([Factor_List], (N-1)),					% append the value of N-1 to the list
			io:format("factors: ~p~n", [Factor_List]),
			factors(N-1);
		Remainder =/= 0 ->
			io:format("then here~n"),
			factors(N-1)
	end.

append([Head|Element], Tail) ->
	[Head|append(Element, Tail)];
append([], Tail) ->
	Tail.

safety()->
	io:format("wag ibenta ang bayan bc u aint a pussy like aguinaldo.~n").

% References:
%	http://erlang.org/doc/efficiency_guide/listHandling.html
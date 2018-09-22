-module(ruz_exer05).
-export([factors/1, safety/1]).

factors(N) ->
% used *list comprehension after seeing sample factors() function on rosettacode.org
% read this line as "The list of factors such that factors
% is taken from the sequence of integers 1 to N, and N % factors = 0"
	io:format("Factors: "),
	[Factors || Factors <- lists:seq(1,N), N rem Factors == 0].

safety(N)->
	% supposed to use lists to determine where the safest place is to be in the killing circle
	% was going to try to remove even-indexed elements until the size of the list is equal to 1
	% but no go, requires higher skill level to unlock area
	% Duterte is supposed to hold the value of the safe spot (also bc I'm pretty sure binebenta tayo ni duts sa china but yeah)
	Politicians = lists:seq(1,N),
	Duterte = lists:partition(fun(Politicians) -> Politicians rem 2 == 1 end, Politicians),
	io:format("Safe spot: "),
	io:format("~p~n", [Duterte]).
	% at this point, Duterte is tuple. Was also supposed to remove the other lists from the tuple for better result

% References:
%	http://erlang.org/doc/efficiency_guide/listHandling.html
%	https://rosettacode.org/wiki/Factors_of_an_integer#Recursive
%	*http://erlang.org/doc/programming_examples/list_comprehensions.html ang handy omg
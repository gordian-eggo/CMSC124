-module(ruz_exer05).
-export([factors/1, safety/0]).

factors(N) ->
% used list comprehension after seeing sample factors() function on rosettacode.org
% read this line as "The list of factors such that factors
% is taken from the sequence of integers 1 to N, and N % factors = 0"
	[Factors || Factors <- lists:seq(1,N), N rem Factors == 0].

safety()->
	io:format("wag ibenta ang bayan bc u aint a pussy like aguinaldo.~n").

% References:
%	http://erlang.org/doc/efficiency_guide/listHandling.html
%	https://rosettacode.org/wiki/Factors_of_an_integer#Recursive
%	http://erlang.org/doc/programming_examples/list_comprehensions.html 
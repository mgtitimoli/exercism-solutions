-module(collatz_conjecture).

-export([steps/1]).

steps(N) when is_integer(N), N > 0 -> steps(N, 0);
% Exercism should expect a function_clause error instead of this other
steps(_) -> error(badarg).

steps(1, Result) ->
  Result;
steps(N, Result) when N rem 2 =:= 0 ->
  steps(N div 2, Result + 1);
steps(N, Result) ->
  steps(N * 3 + 1, Result + 1).

%%%----------------------------------------------------------------------
%%% File    : nobif.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 18 Jun 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(nobif).
-include_lib("eunit/include/eunit.hrl").
-export([powers/2, get_args/0]).

% powers/2 comments:
% I created this functions because the BIF returns float and I need integer. (BIF means built-in function).
% The "when" clause is an example of non-defensive programming, a practice encouraged in Erlang.
-spec(powers(Base::integer(), Exp::integer()) -> integer()).
powers(Base, Exp) when Base>0 ->
   case Exp>0 of
      true ->
         Base * powers(Base, Exp-1);
      false ->
         1
   end.

%This function gets the plain arguments passed to the erlang init process from the shell script.
%We are no longer executing this function. We have incorporated this into function "program".
-spec(get_args() -> {string(), string(), string()}).
get_args() ->
   [A,B,C] = init:get_plain_arguments(),
      Arg1 = string:to_integer(A),
      Arg2 = string:to_integer(B),
      Arg3 = string:to_integer(C),
      NTemp = element(1, Arg1),
      N = powers(26, NTemp),
      D = element(1, Arg2),
      K = element(1, Arg3),
      [N, D, K].

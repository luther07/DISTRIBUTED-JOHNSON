%%%----------------------------------------------------------------------
%%% File    : nobif.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 18 Jun 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(nobif).
-include_lib("eunit/include/eunit.hrl").
-export([powers/2]).

% powers/2 comments:
% I created this functions because the BIF returns float and I need integer. (BIF means built-in function).
% The "when" clause is an example of non-defensive programming, a practice encouraged in Erlang.

-spec(powers(Base::integer(), Expo::integer()) -> integer()).
powers(Base, Expo) when Base>0 ->
   case Expo>0 of
      true ->
         Base * powers(Base, Expo-1);
      false ->
         1
   end.

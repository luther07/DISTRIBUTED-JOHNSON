%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified: 18 June 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(mainprogram).
-include_lib("eunit/include/eunit.hrl").
-import(nobif, [powers/2]).
-export([program/0]).

%This is the main function which times all the calls to the methods in module hashmod.
program() ->
   [A,B,C] = init:get_plain_arguments(),
   Arg1 = string:to_integer(A),
   Arg2 = string:to_integer(B),
   Arg3 = string:to_integer(C),
   NTemp = element(1, Arg1),
   N = powers(26, NTemp),
   D = element(1, Arg2),
   K = element(1, Arg3),
	
   TabId = ets:new(myTable, [set]),
   PercentNum = N*D/100,
   InputTime = timer:tc(hashmod,hashin,[TabId, N, K]),
   OutputTime = timer:tc(hashmod,hashout,[TabId, PercentNum, K]),
   ReInputTime = timer:tc(hashmod,rehash,[TabId, PercentNum, K]),
   NewLine = "\n",
   Comma = ",",
   Number = integer_to_list(N),
   case InputTime of
      {Time1,_} ->
         Output1 = integer_to_list(Time1),
         {ok, F}=file:open("Results.txt", [append]),
         file:write(F, Number),
         file:write(F, Comma),
         file:write(F,Output1),
         file:write(F,Comma)
   end,
   
   case OutputTime of
      {Time2,_} ->
         Output2 = integer_to_list(Time2),
         file:write(F,Output2),
         file:write(F,Comma)
   end,
	
   case ReInputTime of
      {Time3,_} ->
         Output3 = integer_to_list(Time3),
         file:write(F,Output3),
         file:write(F,NewLine),
         file:close(F)
   end,

   init:stop().

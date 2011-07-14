%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified: 14 July 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

%%%----------------------------------------------------------------------
%%% TODO: Take the file i/o statements out of the case statements,
%%%       put the i/o statements in a separate block. Then the
%%%       case statements will be shorter and simpler.
%%%----------------------------------------------------------------------

-module(mainprogram).
-include_lib("eunit/include/eunit.hrl").
-import(nobif, [powers/2]).
-export([program/0]).

%This is the main function which times all the calls to the methods in module hashmod.
program() ->
   [N,D,K] = nobif:get_args(),	
   TabId = ets:new(myTable, [set]),
   PercentNum = N*D/100,
   InputTime = timer:tc(hashmod,hashin,[TabId, N, K]),
   OutputTime = timer:tc(hashmod,hashout,[TabId, PercentNum, K]),
   ReInputTime = timer:tc(hashmod,rehash,[TabId, PercentNum, K]),
   NewLine = "\n",
   Comma = ",",
   Number = integer_to_list(N),

%Open file Results.txt
   {ok, F}=file:open("Results.txt", [append]),

%Writing to file, the cardinality of the sample space N, followed by comma, followed by the time in milliseconds
%to input the sample points into the key/value store, followed by comma.
   case InputTime of
      {Time1,_} ->
         Output1 = integer_to_list(Time1)
   end,

%Writing to file, the time in milliseconds to delete the sample points from the key/value store, followed by comma.
   case OutputTime of
      {Time2,_} ->
         Output2 = integer_to_list(Time2)
   end,

%Writing to file, the time in milliseconds to re-input the sample points into the key/value store. 
   case ReInputTime of
      {Time3,_} ->
         Output3 = integer_to_list(Time3)
   end,

%Write block. Writing our data to the file.
file:write(F,Number),
file:write(F,Comma),
file:write(F,Output1),
file:write(F,Comma),
file:write(F,Output2),
file:write(F,Comma),
file:write(F,Output3),
file:write(F,NewLine),

%Close file Results.txt
   file:close(F),

   init:stop().

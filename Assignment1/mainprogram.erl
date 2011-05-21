%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified: 21 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(mainprogram).
-export([program/3, get_args/0, powers/2]).

% powers/2 comments:
% I created this functions because the BIF returns float and I need integer.
% (BIF means built-in function).
% 18 May 2011: Now this function has really been tested and really works.
% Case where Base equals 0 is not handled.
% See tests:test_series/0 for tests.

powers(Base, Expo) ->
	case Expo>0 of
		true ->
			Base * powers(Base, Expo-1);
		false ->
			1
	end.

%This function gets the plain arguments passed to the erlang init process from the shell script.
get_args() ->
	MyArgs = init:get_plain_arguments(),
	Arg1 = string:to_integer(hd(MyArgs)),
	Arg2 = string:to_integer(hd(tl(MyArgs))),
	Arg3 = string:to_integer(hd(tl(tl(MyArgs)))),
	NTemp = element(1, Arg1),
	N = powers(26, NTemp),
	D = element(1, Arg2),
	K = element(1, Arg3),
	program(N, D, K).

%This is the main function which times all the calls to the methods in module hashmod.
program(N, D, K) ->
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

%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(mainprogram).
-export([program/3, get_args/0]).

get_args() ->
	MyArgs = init:get_plain_arguments(),
	Arg1 = hd(MyArgs),
	Arg2 = hd(tl(MyArgs)),
	Arg3 = hd(tl(tl(MyArgs))),
	Args1 = string:to_integer(Arg1),
	Args2 = string:to_integer(Arg2),
	Args3 = string:to_integer(Arg3),
	N = element(1, Args1),
	D = element(1, Args2),
	K = element(1, Args3),
	program(N, D, K).

program(N, D, K) ->
	
	TabId = ets:new(myTable, [set]),
	PercentNum = N*D/100,
	InputTime = timer:tc(hashmod,hashin,[TabId, N, K]),
	OutputTime = timer:tc(hashmod,hashout,[TabId, PercentNum, K]),
	ReInputTime = timer:tc(hashmod,rehash,[TabId, PercentNum, K]),
	NewLine = "\n",
	Comma = ",",
	case InputTime of
		{Time1,_} ->
			Output1 = integer_to_list(Time1),
			io:fwrite(Output1),
			io:fwrite("\n"),
			{ok, F}=file:open("a.txt", [read,write]),
			file:write(F,Output1),
			file:write(F,Comma)
	end,
	case OutputTime of
		{Time2,_} ->
			Output2 = integer_to_list(Time2),
			io:fwrite(Output2),
			io:fwrite("\n"),
			file:write(F,Output2),
			file:write(F,Comma)
	end,
	case ReInputTime of
		{Time3,_} ->
			Output3 = integer_to_list(Time3),
			io:fwrite(Output3),
			io:fwrite("\n"),
			file:write(F,Output3),
			file:write(F,NewLine)
	end,
	init:stop().

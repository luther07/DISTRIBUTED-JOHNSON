%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(mainprogram).
-export([program/3, get_args/0, prep_file/0, powers/2]).

%I had to create this functions because the BIF returns float and I need int.
%I have tested this function and it works.
powers(Base, Expo) ->
	case Expo>0 of
		true ->
			Base * powers(Base, Expo-1);
		false ->
			Base
	end.

get_args() ->
	MyArgs = init:get_plain_arguments(),
	Temp1 = hd(MyArgs),
	Temp2 = hd(tl(MyArgs)),
	Temp3 = hd(tl(tl(MyArgs))),
	Arg1 = string:to_integer(Temp1),
	Arg2 = string:to_integer(Temp2),
	Arg3 = string:to_integer(Temp3),
	NTemp = element(1, Arg1),
	N = powers(26, NTemp),
	D = element(1, Arg2),
	K = element(1, Arg3),
	program(N, D, K).

%This function writes the first line, field names to the file.
prep_file() ->
	{ok, G}=file:open("Results.txt", [append]),
			file:write(G,"Number,"),
			file:write(G,"N,"),
			file:write(G,"D,"),
			file:write(G,"K\n,"),
			file:close(G),
			init:stop().

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
			io:fwrite(Output1),
			io:fwrite("\n"),
			{ok, F}=file:open("Results.txt", [append]),
			file:write(F, Number),
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
			file:write(F,NewLine),
			file:close(F)
	end,
	init:stop().

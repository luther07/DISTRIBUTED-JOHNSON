%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(mainprogram).
-export([program/3]).

program(N, D, K) ->
	TabId = ets:new(myTable, [set]),
	PercentNum = N*D/100,
	InTime = timer:tc(hashmod,hashin,[TabId, N, K]),
	OutTime = timer:tc(hashmod,hashout,[TabId, PercentNum, K]),
	BackInTime = timer:tc(hashmod,rehash,[TabId, PercentNum, K]),
	NewLine = "\n",
	Comma = ",",
	case InTime of
		{Time1,Value1} ->
			Output1 = integer_to_list(Time1),
			io:fwrite(Output1),
			io:fwrite("\n"),
			{ok, F}=file:open("a.txt", [read,write]),
			file:write(F,Output1),
			file:write(F,Comma)
	end,
	case OutTime of
		{Time2,Value2} ->
			Output2 = integer_to_list(Time2),
			io:fwrite(Output2),
			io:fwrite("\n"),
			file:write(F,Output2),
			file:write(F,Comma)
	end,
	case BackInTime of
		{Time3,Value3} ->
			Output3 = integer_to_list(Time3),
			io:fwrite(Output3),
			io:fwrite("\n"),
			file:write(F,Output3),
			file:write(F,NewLine)
	end.

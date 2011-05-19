%%%----------------------------------------------------------------------
%%% File    : mainprogram.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 08 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified: 18 May 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Changelog:18 May 2011 fixed incorrect powers module
%%%----------------------------------------------------------------------

-module(mainprogram).
-export([program/3, get_args/0, prep_file/0, powers/2]).

% powers/2 comments:
% I created this functions because the BIF returns float and I need integer.
% (BIF means built-in function).
% This function has been tested and it works.
% 18 May 2011: Now this function has really been tested and really works.
% See tests:test_series/0 for tests.

powers(Base, Expo) ->
	case Expo>0 of
		true ->
			Base * powers(Base, Expo-1);
		false ->
			1
	end.

%This function gets the plain arguments passed to the erlang init process from the shell script.
%This function has been presenting problems. Not sure what's wrong yet. I'll fix it in no time!
%After adding debugging outputs I find that this function is probably working correctly.
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
	%io:fwrite("Assigned the return value of function powers to N\n"),
	D = element(1, Arg2),
	%io:fwrite("Assigned first element of Arg2 tuple to D\n"),
	K = element(1, Arg3),
	%io:fwrite("Assigned first element of Arg3 tuble to K,\n"),
	%io:fwrite("...followed by passing arguments N, D, and K to function program\n"),
	program(N, D, K).

%This function writes the first line, field names to the file.
%This function has been tested and it works.
prep_file() ->
	{ok, G}=file:open("Results.txt", [append]),
			file:write(G,"Number,"),
			file:write(G,"N,"),
			file:write(G,"D,"),
			file:write(G,"K\n,"),
			file:close(G),
			init:stop().

%This is the main function which times all the calls to the methods in module hashmod.
%Now this main function appears to be the current culprit!
%Per tv:start() table visualizer, 26 items were inserted in myTable, Table Id 8207.
%Per tv:start() table visualizer, 676 items were inserted in myTable, Table Id 8207. I am able to examine all the data in the table.
%Per tv:start() table visualizer, 17576 items were inserted in myTable, Table Id 8207. I am able to examine all the data in the table.
%Per tv:start() table visualizer, 456969 items were inserted in myTable, Table Id 8207. I am able to examine all the data in the table.

program(N, D, K) ->
	io:fwrite("Hello World, we're up and running!!!\n"),
	TabId = ets:new(myTable, [set]),
	tv:start(),
	io:fwrite("The hashset table gets created?\n"),
	PercentNum = N*D/100,
	io:fwrite("The number of items equivalent to D percent of N is assigned?\n"),
	InputTime = timer:tc(hashmod,hashin,[TabId, N, K]),
	io:fwrite("Do we get the measure time to insert N items?\n"),
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

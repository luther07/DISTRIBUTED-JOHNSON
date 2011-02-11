%%%----------------------------------------------------------------------
%%% File    : prep.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Runs the functions in module "hashmod" and times the operations
%%% Created : 10 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%%----------------------------------------------------------------------

-module(prep).
-export([prep_file/0]).

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


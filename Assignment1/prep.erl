%%%----------------------------------------------------------------------
%%% File    : prep.erl
%%% Author  : Mark Johnson <mjohnson4@luc.edu>
%%% Purpose : Preps the file, "Results.txt"
%%% Created : 10 Feb 2011 by Mark Johnson <mjohnson4@luc.edu>
%%% Modified: 17 May 2011 by Mark Johnson <mjohnson@luc.edu>
%%%----------------------------------------------------------------------

-module(prep).
-export([prep_file/0]).

%This function writes the first line and field names to the file.
%This function has been tested and it works.
prep_file() ->
	{ok, G}=file:open("Results.txt", [append]),
			file:write(G,"Number,"),
			file:write(G,"N,"),
			file:write(G,"D,"),
			file:write(G,"K\n,"),
			file:close(G),
			init:stop().


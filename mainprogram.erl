-module(mainprogram).
-export([program/3]).

program(N, D, K) ->
	TabId = ets:new(myTable, [set]),
	hashmod:hashin(TabId, N),
	ets:info(TabId).

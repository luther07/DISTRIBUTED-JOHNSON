-module(mainprogram).
-export([program/3]).

program(N, D, K) ->
	TabId = ets:new(myTable, [set]),
	Percent = N*D/100,
	hashmod:hashin(TabId, N, K),
	hashmod:hashout(TabId, Percent, K),
	ets:info(TabId).

-module(hashmod).
-export([hashin/1]).

hashin(MyInt) -> 
	TabId = ets:new(myTable, []),
	case MyInt>0 of
		true ->
			MyRandom = randomstring:get(5,"abcdefg"),
			ets:insert(TabId,{MyRandom,MyRandom}),
			MyInt + hash(MyInt-1);
		false -> MyInt
	end.
	



-module(hashmod).
-export([hashin/3, hashout/3, rehash/3]).

hashout(TabId, PercentNum, K) ->
	case PercentNum>0 of
		true -> 
			MyRandom = randomstring:get(K, "abcdefghijklmnopqrstuvwxyz"),
			RandomMatch = ets:lookup(TabId, MyRandom),
			case RandomMatch of
				[] ->
					hashout(TabId, PercentNum, K);
				_ ->
					ets:delete(TabId, RandomMatch),
					hashout(TabId, PercentNum-1, K)
			end;
		false ->
			PercentNum
	end.

hashin(TabId, N, K) -> 
	case N>0 of
		true ->
			MyRandom = randomstring:get(K,"abcdefghijklmnopqrstuvwxyz"),
			RandomMatch = ets:lookup(TabId, MyRandom),
			case RandomMatch of
				[] ->
					hashin(TabId, N, K);
				_ ->
					ets:insert(TabId,{MyRandom,MyRandom}),
					hashin(TabId, N-1, K)
			end;
		false -> N
	end.

rehash(TabId, PercentNum, K) ->
	MyRandom = randomstring:get(K, "abcdefghijklmnopqrstuvwxzy"),
	RandomMatch = ets:lookup(TabId, MyRandom),
	case PercentNum>0 of
		true ->
			case RandomMatch of
				[] ->
					rehash(TabId, PercentNum, K);
				_ ->
					ets:insert(TabId, {MyRandom, MyRandom}),
					rehash(TabId, PercentNum-1, K)
			end;
		false ->
			PercentNum
	end.


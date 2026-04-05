-module(my_lists).

-export([filter/2, map/2, fold/3]).

filter(Predicate, List) ->
    filter(Predicate, List, []).

filter(_, [], DestList) ->
    lists:reverse(DestList);
filter(Predicate, [SourceHead | SourceRest], DestList) ->
    case Predicate(SourceHead) of
        true -> filter(Predicate, SourceRest, [SourceHead | DestList]);
        _ -> filter(Predicate, SourceRest, DestList)
    end.

map(Mapper, List) -> map(Mapper, List, []).

map(_, [], DestList) ->
    lists:reverse(DestList);
map(Mapper, [SourceHead | SourceRest], DestList) ->
    map(Mapper, SourceRest, [Mapper(SourceHead) | DestList]).

fold(_, Acc, []) -> Acc;
fold(Fun, Acc, [Head | Rest]) -> fold(Fun, Fun(Head, Acc), Rest).

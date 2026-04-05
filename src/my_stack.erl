-module(my_stack).

-export([new/0, length/1, push/2, pop/1]).

-record(my_stack, {length = 0, items = []}).

new() -> #my_stack{}.

length(#my_stack{length = L}) -> L.

push(#my_stack{length = L, items = Items}, Item) ->
    #my_stack{length = L + 1, items = [Item | Items]}.

pop(#my_stack{length = 0}) ->
    error(empty_stack);
pop(#my_stack{items = []}) ->
    error(empty_stack);
pop(#my_stack{length = L, items = [Head | Tail]}) ->
    {Head, #my_stack{length = L - 1, items = Tail}}.

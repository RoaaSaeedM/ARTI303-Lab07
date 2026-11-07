% Part 1: Shopping program. Start with five items.
shopping :-
    shopping_menu([coffee, milk, chocolate, apple, juice]).

shopping_menu(Basket) :-
    nl,
    write('d - Display all items'), nl,
    write('a - Add an item'), nl,
    write('e - Exit'), nl,
    write('Enter your choice followed by a period: '),
    read(Choice),
    shopping_action(Choice, Basket).

shopping_action(d, Basket) :-
    write('Basket:'), nl,
    display_items(Basket),
    shopping_menu(Basket).
shopping_action(a, Basket) :-
    write('Enter an item followed by a period: '),
    read(Item),
    add_at_the_end(Item, Basket, NewBasket),
    write('Item added.'), nl,
    shopping_menu(NewBasket).
shopping_action(e, _) :-
    write('Goodbye!'), nl.

% Display each item recursively; stop at the empty list.
display_items([]).
display_items([Head|Tail]) :-
    write(Head), nl,
    display_items(Tail).

% Part 2, Task 1: Remove every occurrence of X.
deleteElement(_, [], []).
deleteElement(X, [X|Tail], Result) :-
    !,
    deleteElement(X, Tail, Result).
deleteElement(X, [Head|Tail], [Head|Result]) :-
    X \= Head,
    deleteElement(X, Tail, Result).

% Part 2, Task 2: Add X at the end using recursion.
add_at_the_end(X, [], [X]).
add_at_the_end(X, [Head|Tail], [Head|Result]) :-
    add_at_the_end(X, Tail, Result).


:- dynamic character/1.

% Lab 09 - Name Game

play :-
    nl,
    writeln('Welcome to the Name Game!'),
    writeln('Create your name by adding or deleting letters.'),
    show_menu.

% Display Menu
show_menu :-
    nl,
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Option),
    process(Option).

% Display Current Letters
process(1) :-
    findall(C, character(C), List),
    write('Letters: '),
    writeln(List),
    show_menu.

% Add Letter
process(2) :-
    write('Enter a letter: '),
    read(C),
    assertz(character(C)),
    writeln('Letter added successfully.'),
    show_menu.

% Insert Letter at Top
process(3) :-
    write('Enter a letter: '),
    read(C),
    asserta(character(C)),
    writeln('Letter inserted at the top.'),
    show_menu.

% Insert Letter at Bottom
process(4) :-
    write('Enter a letter: '),
    read(C),
    assertz(character(C)),
    writeln('Letter inserted at the bottom.'),
    show_menu.

% Remove One Letter
process(5) :-
    write('Enter a letter to remove: '),
    read(C),
    (   retract(character(C))
    ->  writeln('Letter removed successfully.')
    ;   writeln('Letter does not exist.')
    ),
    show_menu.

% Remove All Letters
process(6) :-
    retractall(character(_)),
    writeln('All letters have been removed.'),
    show_menu.

% Exit Game
process(7) :-
    writeln('Thank you for playing!').

% Handle Invalid Input
process(_) :-
    writeln('Invalid option. Please try again.'),
    show_menu.

grammar PortableTetrisNotation;

notation: meta game ;
meta: (title | plat | date | src)+ ;
game: (level | move | comment)+ ;
title: TITLE ;
plat: PLAT ;
date: DATE ;
src: SRC ;
level: LEVEL ;
move: MOVE ;
comment: COMMENT ;

LEVEL: '=' 'Level' WS DIGIT+ '\n' ;
MOVE: 'I' '-' SPAN4 BOTTOMROW? LINECLEAR? RATING?
    | 'I' '-' SPAN1 BOTTOMROW? LINECLEAR? RATING?
    | 'O' '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    | 'S' '-' SPAN3 BOTTOMROW? LINECLEAR? RATING?
    | 'S' '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    | 'Z' '-' SPAN3 BOTTOMROW? LINECLEAR? RATING?
    | 'Z' '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    | 'T' UD '-' SPAN3 BOTTOMROW? LINECLEAR? RATING?
    | 'T' LR '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    | 'L' UD '-' SPAN3 BOTTOMROW? LINECLEAR? RATING?
    | 'L' LR '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    | 'J' UD '-' SPAN3 BOTTOMROW? LINECLEAR? RATING?
    | 'J' LR '-' SPAN2 BOTTOMROW? LINECLEAR? RATING?
    ;
LR: 'l' | 'r' ;
UD: 'u' | 'd' ;
BOTTOMROW: '@' [0-9] [0-9]? ;
RATING: '??' | '?!' | '!!' | '!?' | '?' | '!' ;
LINECLEAR: '/SINGLE' | '/DOUBLE' | '/TRIPLE' | '/TETRIS' ;
WS: [ \t\n\r\f]+ -> skip ;
DIGIT: [0-9] ;
SPAN4: '0123' | '1234' | '2345' | '3456' | '4567' | '5678' | '6789' | '7890' ;
SPAN3: '012' | '123' | '234' | '345' | '456' | '567' | '678' | '789' | '890' ;
SPAN2: '01' | '12' | '23' | '34' | '45' | '56' | '67' | '78' | '89' | '90' ;
SPAN1: [0-9] ;
TITLE: 'Title:' .*? '\n' ;
PLAT: 'Platform:' .*? '\n' ;
DATE: 'Date:' .*? '\n' ;
SRC: 'Source:' .*? '\n' ;
COMMENT: '(' .*? ')' ;


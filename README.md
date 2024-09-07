
# Tetris Game notation

The overall goal is based on the chess community, where chess games (or fragments thereof)
can be easily exchanged, providing a common basis for software to import/export, as well
as for humans to read, analyze, and commentate.

The goal is not to directly record every player movement (for example, last minute
adjustments) although an open-ended comment field allows something like this. Similar to
chess notation, where a player hovering their hand over a piece for a second before
deciding to move something else, is not normally notated.

## Existing work:

NES Tetris Trainer (StackRabbit API)

    firstPlacement: [0, 2, 19], secondPlacement: [1, -1, 18]
  
 - The first number is rotation based on the piece's starting position
 - The second number is movement (negative=left postive=right) based on the piece's starting position.
 - The third number is how far down the piece went.
 - First and second placement relates to whether it's taking into account the 'next' piece.
A good format for an AI that analyzes moves by feasibility of playing, but not the most friendly for a human reader.


NES Tetris Trainer (UI)

    Tu-456 S-67

This uses the seven conventional piece names, {IOLJTSZ} and specifies how many columns the
piece spans when landing. Columns are labeled left to right starting with 1, and using a 0
to represent column 10.

For example an I piece has only two possible landing positions, a vertical one that spans
one column, and a horizontal one that spans 4 columns. Thus there is no ambuguity about
rotation. The same goes for S and Z pieces, which span either 2 or 3 columns depending on
rotation. And of course, the O piece effectively doesn't rotate, and always spans two
columns.

For the T, L, and J pieces, there are four possible rotations, and these are denoted with
one of {udlr} for up, down, left, right, with the starting position of each piece being
'down'. Explained another way, each of these pieces has a short 'nub' that sticks out in
the direction indicated. So Tu-456 means the T shape was flipped 180 degrees with the nub
"up" and landed across columns 456.

Generally the piece is assumed to have dropped directly downward. Tucks and spins don't
have special notation that I could see, which could make this format ambuguous,
especially if (say) notating a game that had a misdrop.


Tetrisfish

Excellent site. It has puzzles, but they are interactive drag-the-piece-around interfaces,
with no user-facing notation that I can find.

## Notation

Tetris fandom is, more than most, defined by its awesome community, so I'd leave final
decisions to the collective will of the community. But I'd suggest following the Tetris
Trainer format for humans, in a list like chess notation, with newlines allowed anywhere
for readability. Like chess notation, each move can optionally be notated with ?, ??, !,
!!, !?, or ?! with similar meanings. Line clears are denoted as /SINGLE, /DOUBLE, /TRIPLE,
/TETRIS, and level changes are optionally marked on their own, = prefixed line. Any
commentary can appear in parentheses including recording the current score.

To avoid the ambiguity in moves like VITS, where `I-9` (Vertical I-bar on column 9) could
more than one possible interpretation, an extension to the grammar is that you can
indicate the lowest row that the piece lands on with an @ immediately after the piece.
The bottommost row is 1.

So a VITS might get notated like the following, including a comment

    I-9@1 (VITS)

But a misdrop, still on column 9, might leave the vertical bar stranded higher up, like

    I-9@6??

Here's a partial example of a notated game (scuti.ptn)

    Title: Blue Scuti's famous game
    Platform: NES
    Date: 2-Jan-2024
    Source: https://www.youtube.com/watch?v=J9oVQ43j22g
    =Level 19
    Lr-12 Tu-345 I-6789 O-23 Jl-89
    O-12 Tu-567 Z-345 Jl-78 S-23
    O-56 (adjusted) Z-45 O-34 S-89 Tl-45
    Tl-90?! Jr-12 O-67/DOUBLE I-6789/SINGLE S-234
    Jr-78 (tetris ready!) Ll-56 Jd-789 S-345 Tr-12
    Lu-789 Td-123 Lu-678 Tu-567 I-0@1/TETRIS! (score=26800)
    ...

The final tetris demonstrates almost every feature of the notation, even though in
practice one would not need to indicate the bottom row in that situation.

The file PortableTetrisNotation.g4 contains an ANTLR4 grammar to validate PTN files.

Install [antlr-tools](https://www.antlr.org/tools.html) then you can run a test with

    antlr4-parse PortableTetrisNotation.g4 notation scuti.ptn

This format description and the associated grammar are released to the public domain
and are free for all uses.

This project is dedicated to Michael Sperberg-McQueen (1954-2024) without whom I
wouldn't be nearly such a parser geek.

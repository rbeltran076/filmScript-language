# filmScript: A language for movie enthusiast
## Overview
filmScript is a simple programming language that uses movie titles instead of traditional keywords. The language includes basic constructs such as conditional statements, variable declarations, and loops. The implementation involves a lexer (implemented using Flex) and a parser (implemented using Bison).


what_if: Conditional statement, similar to "if" in traditional languages.
elf: "Else" statement for handling alternative cases.
fantastic: Keyword for declaring variables.
wall-e: Keyword for a loop construct.
IDENTIFIER: Represents variable names or values.
EOL: End of line.

## Lexer (filmScript.l)
The lexer is responsible for breaking the input code into individual tokens, recognizing keywords, and assigning values to identifiers.
Token Definitions
what_if, elf, fantastic, wall-e: Keywords recognized by the lexer.
IDENTIFIER: Represents variable names or values.
EOL: Represents the end of a line.
Token Actions
what_if, elf, fantastic, wall-e: Return the corresponding token.
IDENTIFIER: Save the string value in yylval.strval.
EOL: Return the end-of-line token.
## Error Handling
Unrecognized tokens trigger the yyerror function.




After running this with flex you get the lex.yy.c


## Parser (filmScript.y)
The parser processes the tokens produced by the lexer and constructs a syntax tree according to the filmScript language grammar.
## Grammar Rules
script: Represents the entire filmScript program.
lines: Represents a sequence of script lines.
line: Represents a single line of code.
expression: Represents conditional expressions or variable assignments.
Semantic Actions
what_if, elf, fantasic, wall-e: Print corresponding statements.
IDENTIFIER expression: Print variable assignment statement.
expression '>' expression, expression '<' expression: Evaluate and print conditional expressions.
error EOL: Handle syntax errors with the yyerror function.
Semantic Values
%union: Declares a union type to store different semantic values.
<strval> expression: Specifies that the semantic value of the expression non-terminal is a string.
Error Handling
yyerror: Prints an error message on syntax errors.

After running this with bison we get the y.tab.h & t.tab.c


## Sample (scene.txt)
Scene.txt is the file where we can write the code


## How to run filmScript
To run film script well first run the files with flex and bison and then compile them


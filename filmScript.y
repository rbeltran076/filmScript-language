%{
#include <stdio.h>
#include <stdlib.h>
%}

%token WHAT_IF ELF FANTASIC WALL_E IDENTIFIER EOL

%left '>' '<'

%%

script: lines
      ;

lines: lines line
      | line
      ;

line: WHAT_IF expression EOL      { printf("What if statement: %s\n", $2); }
    | FANTASIC IDENTIFIER EOL   { printf("Int declaration: %s\n", $2); }
    | ELF EOL                   { printf("Else statement\n"); }
    | WALL_E EOL                { printf("While loop\n"); }
    | IDENTIFIER expression EOL { printf("Variable assignment: %s = %s\n", $1, $2); }
    | error EOL                 { yyerror("Syntax error"); }
    ;

expression: expression '>' expression  { $$ = "true"; }
          | expression '<' expression  { $$ = "false"; }
          | IDENTIFIER              { $$ = $1; }
          ;

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;
    yyparse();

    fclose(input_file);

    return 0;
}

int yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

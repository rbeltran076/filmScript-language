%{
#include "y.tab.h"
#include <string.h>
%}

%option noyywrap

%%
what_if   { return WHAT_IF; }
elf       { return ELF; }
zodiac    { return FANTASIC; }
wall-e    { return IDENTIFIER; }
fantasic  { return IDENTIFIER; }
[a-zA-Z]+ { yylval = strdup(yytext); return IDENTIFIER; }
\n        { return EOL; }
[ \t]     ; /* ignore whitespace */
.         { yyerror("Unrecognized token"); }
%%



int yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

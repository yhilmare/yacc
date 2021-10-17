%{
    #include "y.tab.h"
    #include "symbol.h"
    #include <math.h>
%}
%%

([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
    yylval.val = atof(yytext);
    return NUMBER;
}
[ \t] ;
[a-zA-Z][a-zA-Z0-9]+ {
    yylval.ptr = symbol_look(yytext);
    return NAME;
}
\n return 0;
. return yytext[0];
%%
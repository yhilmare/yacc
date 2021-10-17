%{
    #include <stdio.h>
    #include "symbol.h"
    #include <math.h>
    void yyerror(char *);
%}
%union {
    double val;
    struct symbol_item *ptr;
}
%token<ptr> NAME
%token<val> NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type<val> expression
%%
statement: NAME '=' expression {
    $1->value = $3;
} | expression {
    printf("=%lf\n", $1);
};
expression: expression '+' expression {
    $$ = $1 + $3;
} | expression '-' expression {
    $$ = $1 - $3;
} | expression '/' expression {
    if ($3 == 0) {
        yyerror("can not divided by zero");
    } else {
        $$ = $1 / $3;
    }
} | expression '*' expression {
    $$ = $1 * $3;
} | '-' expression %prec UMINUS {
    $$ = - $2;
} | '(' expression ')' {
    $$ = $2;
};
expression: NUMBER {
    $$ = $1;
} | NAME {
    $$ = $1->value;
} | NAME '(' expression ')' {
    $$ = $1->fp($3);
}
%%
extern FILE *yyin;
void yyerror(char *s) {
    printf("syntax error: %s\n", s);
}
extern double sqrt();
void calculate() {
    add_function("sqrt", sqrt);
    do {
        yyparse();
    } while (!feof(yyin));
}
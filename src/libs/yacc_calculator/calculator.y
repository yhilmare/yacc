%{
    #include <stdio.h>
    void yyerror(char *);
%}

%token NUMBER NAME ADD
%left ADD '-'
%left '*' '/'
%nonassoc UMINUS
%%

statement: NAME '=' expression
| expression {
    printf("=%d\n", $1);
};

expression: expression ADD expression {
    $$ = $1 + $3;
} | expression '-' expression {
    $$ = $1 - $3;
} | expression '*' expression {
    $$ = $1 * $3;
} | expression '/' expression {
    if ($3 == 0) {
        yyerror("can not divided by zero");
    } else {
        $$ = $1 / $3;
    }
} | '-' expression %prec UMINUS {
    $$ = -$2;
} | '(' expression ')' {
    $$ = $2;
} | NUMBER {
    $$ = $1;
};
%%

extern FILE *yyin;
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}
void calculate() {
    do {
        yyparse();
    } while (!feof(yyin));
}
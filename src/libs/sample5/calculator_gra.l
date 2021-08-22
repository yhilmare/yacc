%{
    #include <stdio.h>
%}
%token NUMBER NAME
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%%

statement: NAME '=' expression
        |  expression {
            printf("= %d\n", $1);
        }
        ;
expression: expression '+' expression {
                $$ = $1 + $3;
            }
        |   expression '-' expression {
            $$ = $1 - $3;
        }
        |   expression '*' expression {
            $$ = $1 * $3;
        }
        |   expression '/' expression {
            if ($3 == 0) {
                yyerror("can not be divided by zero");
            } else {
                $$ = $1 / $3;
            }
        }
        |   '-' expression %prec UMINUS {
            $$ = -$2;
        }
        | '(' expression ')' {
            $$ = $2;
        }
        |   NUMBER {
            $$ = $1;
        }
        ;
%%
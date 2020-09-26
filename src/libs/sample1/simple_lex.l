%{
    /*
    测试用的lex文件
    */
%}
%%
[\t ]* ;
go |
come |
npu {
    printf("I love %s", yytext);
}
[a-zA-z]+ {
    printf("input msg is %s", yytext);
}
.|\n ECHO;
%%

void simple_example() {
    yylex();
}
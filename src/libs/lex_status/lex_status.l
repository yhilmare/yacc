%{
    // 带有状态的词法分析，可以理解为自动机的状态，这是一个解析命令行中参数的例子
    // %s 在此处用于定义一个状态
%}
%s FNAME
%%

[ \n\t]+ ;

-h |
--help {
    printf("this is help message\n");
}

-v |
--verbose {
    printf("This is verbose message\n");
}

-f |
--file {
    printf("this is file messgae\n");
    BEGIN FNAME;
}

<FNAME>[^ ]+ {
    printf("file name: %s\n", yytext);
    BEGIN 0;
}

[^ ]+ {
    printf("ECHO: %s\n", yytext);
}
%%

void parse_command_line() {
    yylex();
}
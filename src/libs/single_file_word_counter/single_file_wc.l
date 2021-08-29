%{
    // 单文件输入词频统计lex词法分析程序，只接受单个文件的输入
    unsigned word_count = 0; // 单词数统计
    unsigned line_count = 0; // 行数统计
    unsigned char_count = 0; // 字符数统计
%}

word_reg [^ \t\n]+
eol_reg \n
%%

{word_reg} {
    word_count ++;
    char_count += yyleng;
}

{eol_reg} {
    char_count ++;
    line_count ++;
}

. {
    char_count ++;
}
%%

static int total_exec = 2;
static int outer_argc;
static char** outer_argv;

/*
简单词频统计函数的入口，这个函数只能统计单个输入文件的词频

@param argc: 命令行输入时参数的个数
@param argv: 命令行输入时参数的具体值
*/
int simple_word_count(int argc, char **args) {
    outer_argc = argc;
    outer_argv = args;
    int return_val = yywrap();
    if (return_val == -1) {
        return return_val;
    }
    yylex();
    printf("word_count: %d, line_count: %d, char_count: %d\n", word_count, line_count, char_count);
    close(yyin);
    return 0;
}

int yywrap() {
    if (outer_argc == 2) {
        char *file_path = outer_argv[1];
        close(yyin);
        FILE *fp = fopen(file_path, "r");
        if (!fp) {
            fprintf(stderr, "can not open file \"%s\"\n", file_path);
            return -1;
        }
        yyin = fp;
    }
    if ((--total_exec) >= 0) {
        return 0;
    }
    return 1;
}
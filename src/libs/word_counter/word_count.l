%{
    /**
    统计文件的词汇数目，单词数目，行数
    */
    unsigned word_count = 0, char_count = 0, line_count = 0;
    unsigned total_word_count = 0, total_char_count = 0, total_line_count = 0;
    unsigned file_count;
    unsigned current_file_index = 0;
    char **file_ptr;
%}

word [^ \t\n]+
eol \n
%%

{word} {
    word_count ++;
    char_count += yyleng;
}

{eol} {
    line_count ++;
    char_count ++;
}

. char_count ++;
%%

void word_count_func(int argc, char **args) {
    printf("%15s%15s%15s\n", "char count", "word count", "line count");
    if (argc == 1) {
        file_count = 0;
        yylex();
    } else {
        file_count = argc - 1;
        file_ptr = args + 1;
    }
    yywrap();
    yylex();
    printf("%15u%15u%15u     total\n", total_char_count, total_word_count, total_line_count);
}

int yywrap() {
    if (file_count == 0) {
        return 1;
    }
    if (current_file_index > 0) {
        fclose(yyin);
        printf("%15u%15u%15u     \"%s\"\n", char_count, word_count, line_count, file_ptr[current_file_index - 1]);
        total_char_count += char_count;
        total_line_count += line_count;
        total_word_count += word_count;
        char_count = 0;
        word_count = 0;
        line_count = 0;
    }
    if (current_file_index >= file_count) {
        return 1;
    }
    FILE *file;
    while(current_file_index < file_count) {
        char *file_name = file_ptr[current_file_index ++];
        file = fopen(file_name, "r");
        if (!file) {
            fprintf(stderr, "fail to open %s\n", file_name);
        } else {
            break;
        }
    }
    yyin = file;
    return file ? 0 : 1;
}
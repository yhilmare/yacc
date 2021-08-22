%{
    /*
    通过符号表的方式动态地定义那些是动词，哪些是名词，这样就不用将所有的词法定义写死在lex中
    */
    #include<stdlib.h>
    enum {
        LOOKUP = 0,
        VERB,
        ADJ,
        ADV,
        NOUN,
        PREF,
        PRON,
        CONJ
    };
    int state;
    int add_word(int type, char *word);
    int look_up(char *word);
%}
%%

[\t ] ;

\n {
    state = LOOKUP;
}

^verb {
    state = VERB;
}

^adj {
    state = ADJ;
}

^adv {
    state = ADV;
}

^noun {
    state = NOUN;
}

^pref {
    state = PREF;
}

^pron {
    state = PRON;
}

^conj {
    state = CONJ;
}

[a-zA-Z]+ {
    if (state != LOOKUP) {
        add_word(state, yytext);
    }else {
        int tmp_state = look_up(yytext);
        if (tmp_state == VERB) {
            printf("input str \"%s\" is a verb\n", yytext);
        } else if (tmp_state == ADJ) {
            printf("input str \"%s\" is a adj\n", yytext);
        } else if (tmp_state == ADV) {
            printf("input str \"%s\" is a adv\n", yytext);
        } else if (tmp_state == NOUN) {
            printf("input str \"%s\" is a noun\n", yytext);
        } else if (tmp_state == PREF) {
            printf("input str \"%s\" is a pref\n", yytext);
        } else if (tmp_state == PRON) {
            printf("input str \"%s\" is a pron\n", yytext);
        } else if (tmp_state == CONJ) {
            printf("input str \"%s\" is a conj\n", yytext);
        } else {
            printf("input str \"%s\" is undefined\n", yytext);
        }
    }
}
%%

struct word {
    char *w;
    int type;
    struct word *next;
};

struct word *p_head = NULL;

int add_word(int type, char *w) {
    if (p_head == NULL) {
        p_head = (struct word *)malloc(sizeof(struct word));
        p_head->next = NULL;
    }
    struct word *node = NULL;
    if (look_up(w) != LOOKUP) {
        printf("the word \"%s\" is already defined\n", w);
        return LOOKUP;
    }
    node = (struct word *)malloc(sizeof(struct word));
    struct word *p_last = NULL;
    for(p_last = p_head; p_last->next; p_last = p_last->next);
    node->w = (char *)malloc(strlen(w) + 1);
    strcpy(node->w, w);
    node->type = type;
    p_last->next = node;
    p_last = node;
    p_last->next = NULL;
    return 1;
}

int look_up(char *w) {
    struct word *p = p_head;
    if (p != NULL) {
        p = p->next;
    }else {
        return LOOKUP;
    }
    for(; p; p = p->next) {
        if (strcmp(p->w, w) == 0) {
            return p->type;
        }
    }
    return LOOKUP;
}

void lex_parser_with_symbol_table() {
    yylex();
}
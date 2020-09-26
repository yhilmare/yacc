%{
    /**
    带有语法分析功能的词法分析工具
    */
    #include "y.tab.h"
    #define LOOKUP 0

    int state;

    int add_word(int type, char *w);
    int look_up(char *w);
%}
%%
[\t ] ;
\n {
    state = LOOKUP;
}
;\n {
    state = LOOKUP;
    return 0;
}
^verb {
    state = VERB;
}
^adj {
    state = ADJECTIVE;
}
^adv {
    state = ADVERB;
}
^noun {
    state = NOUN;
}
^pref {
    state = PREPOSITION;
}
^pron {
    state = PRONOUN;
}
^conj {
    state = CONJUNCTION;
}
[a-zA-Z]+ {
    if (state != LOOKUP) {
        add_word(state, yytext);
    }else {
        int tmp_state = look_up(yytext);
        if (tmp_state == VERB) {
            printf("input str \"%s\" is a verb\n", yytext);
            return VERB;
        }else if (tmp_state == ADJECTIVE) {
            printf("input str \"%s\" is a adj\n", yytext);
            return ADJECTIVE;
        }else if (tmp_state == ADVERB) {
            printf("input str \"%s\" is a adv\n", yytext);
            return ADVERB;
        }else if (tmp_state == NOUN) {
            printf("input str \"%s\" is a noun\n", yytext);
            return NOUN;
        }else if (tmp_state == PREPOSITION) {
            printf("input str \"%s\" is a pref\n", yytext);
            return PREPOSITION;
        }else if (tmp_state == PRONOUN) {
            printf("input str \"%s\" is a pron\n", yytext);
            return PRONOUN;
        }else if (tmp_state == CONJUNCTION) {
            printf("input str \"%s\" is a conj\n", yytext);
            return CONJUNCTION;
        }else {
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
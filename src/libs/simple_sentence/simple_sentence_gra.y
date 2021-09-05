%{
    /**
    语法规则文件
    */
    #include<stdio.h>
    void yyerror(char *);
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION
%%

sentence: simple_sentence {
    printf("parse a simple sentence.\n");
}
        | compound_sentence {
            printf("parse a compound_sentence.\n");
        }
        ;
simple_sentence: subject verb object
        | subject verb object preb_phrase
        ;
compound_sentence: simple_sentence CONJUNCTION simple_sentence
        | compound_sentence CONJUNCTION simple_sentence
        ;
subject: NOUN
        | PREPOSITION
        | ADJECTIVE subject
        ;
verb: VERB 
    | ADVERB VERB
    | verb VERB
    ;
object: NOUN
    | ADJECTIVE object
    ;
preb_phrase: PREPOSITION NOUN
    ;
%%

void yyerror(char *msg) {
    fprintf(stderr, "error is %s\n", msg);
}

extern FILE *yyin;

void grammar_parse() {
    do {
        yyparse();
    } while (!feof(yyin));
}
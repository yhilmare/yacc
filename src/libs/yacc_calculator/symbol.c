#include "symbol.h"
#include "string.h"
#include <stdio.h>
struct symbol_item SYMBOL_LIST[SYMBOL_LENGTH];
struct symbol_item *symbol_look(char *s) {
    for (int i = 0; i < SYMBOL_LENGTH; i++) {
        struct symbol_item *item = &SYMBOL_LIST[i];
        if (item->s && strcmp(item->s, s) == 0) {
            return item;
        }
        if (!item->s) {
            item->s=strdup(s);
            return item;
        }
    }
    fprintf(stderr, "too many symbols\n");
    return NULL;
}

void add_function(char *s, func_ptr fp) {
    struct symbol_item *item = symbol_look(s);
    item->fp = fp;
}
#ifndef SYMBOL_H
#define SYMBOL_H
#define SYMBOL_LENGTH 20
typedef double (*func_ptr)();

struct symbol_item {
    char *s;
    double value;
    double (*fp)();
};

struct symbol_item *symbol_look(char *s);
void add_function(char *s, func_ptr fp);
#endif
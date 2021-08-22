#include<iostream>
using namespace std;
 
extern "C" {
    /**
     * 带词汇表的词法分析工具
    */
    void lex_parser_with_symbol_table();
    /**
     * 带有词法分析器的语法分析工具
    */
   void grammar_parse();
}

int main(int argc, char ** args) {
    cout << "Begin..." << endl;
    grammar_parse();
    return 0;
}
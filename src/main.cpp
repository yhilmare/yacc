#include<iostream>
using namespace std;
 
extern "C" {
    /**
     * 最简单的词法分析工具
    */
    void simple_example();
    /**
     * 带词汇表的词法分析工具
    */
    void lex_parser_with_word_list();
    /**
     * 语法分析功能的工具
    */
    void grammar_parse();
}

int main(int argc, char ** args) {
    cout << "Hello, world" << endl;
    grammar_parse();
    return 0;
}
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
   /**
    * 字符数统计工具
    * 
    * @param int 接受命令行第一个参数，用于指示有多少行
    * @param char 接受命令行参数中具体的参数
   */
  void word_count_func(int, char**);
  int simple_word_count(int, char**);
  void parse_command_line();
}

int main(int argc, char ** args) {
    cout << "Begin..." << endl;
    parse_command_line();
    return 0;
}
cmake_minimum_required(VERSION 3.0.0)
project(yacc VERSION 0.1.0)
execute_process(COMMAND ./build.sh build WORKING_DIRECTORY ../)
aux_source_directory(./src SRC_DIR)
link_directories(./src/libs/symbol_table/build ./src/libs/lex_status/build ./src/libs/simple_sentence/build ./src/libs/single_file_word_counter/build ./src/libs/multi_file_word_counter/build)

add_executable(yacc ${SRC_DIR})

target_link_libraries(yacc -lsymbol_table -lcommand_line_parse -lsimple_sentence -lsimple_word_count -lword_count -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

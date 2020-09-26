cmake_minimum_required(VERSION 3.0.0)
project(simple_sentence VERSION 0.1.0)

execute_process(COMMAND yacc -d simple_sentence_gra.l COMMAND lex simple_sentence_word.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(simple_sentence SHARED ${SRC_DIR})

set_target_properties(simple_sentence PROPERTIES OUTPUT_NAME "simple_sentence")

target_link_libraries(simple_sentence -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

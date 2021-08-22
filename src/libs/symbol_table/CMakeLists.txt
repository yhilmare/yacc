cmake_minimum_required(VERSION 3.0.0)
project(symbol_table VERSION 0.1.0)

execute_process(COMMAND lex symbol_table.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(symbol_table SHARED ${SRC_DIR})

set_target_properties(symbol_table PROPERTIES OUTPUT_NAME "symbol_table")

target_link_libraries(symbol_table -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

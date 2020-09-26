cmake_minimum_required(VERSION 3.0.0)
project(sample_3 VERSION 0.1.0)

execute_process(COMMAND yacc -d grammar.l COMMAND lex sample3.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(sample_3 SHARED ${SRC_DIR})

set_target_properties(sample_3 PROPERTIES OUTPUT_NAME "20200925")

target_link_libraries(sample_3 -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

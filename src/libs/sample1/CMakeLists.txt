cmake_minimum_required(VERSION 3.0.0)
project(simple_lex VERSION 0.1.0)

execute_process(COMMAND lex simple_lex.l WORKING_DIRECTORY ../)

aux_source_directory(./ SAMPLE_1_DIR)

add_library(simple_lex SHARED ${SAMPLE_1_DIR})

set_target_properties(simple_lex PROPERTIES OUTPUT_NAME "simple_lex")

target_link_libraries(simple_lex -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

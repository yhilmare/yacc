cmake_minimum_required(VERSION 3.0.0)
project(simple_lex_world_list VERSION 0.1.0)

execute_process(COMMAND lex simple_lex_world_list.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(simple_lex_world_list SHARED ${SRC_DIR})

set_target_properties(simple_lex_world_list PROPERTIES OUTPUT_NAME "simple_lex_world_list")

target_link_libraries(simple_lex_world_list -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

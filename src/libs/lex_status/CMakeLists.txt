cmake_minimum_required(VERSION 3.0.0)
project(command_line_parse VERSION 0.1.0)

execute_process(COMMAND lex lex_status.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(command_line_parse SHARED ${SRC_DIR})

set_target_properties(command_line_parse PROPERTIES OUTPUT_NAME "command_line_parse")

target_link_libraries(command_line_parse -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

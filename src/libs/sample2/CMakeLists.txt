cmake_minimum_required(VERSION 3.0.0)
project(sample_2 VERSION 0.1.0)

execute_process(COMMAND lex 20200920-1.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(sample_2 SHARED ${SRC_DIR})

set_target_properties(sample_2 PROPERTIES OUTPUT_NAME "20200920_1")

target_link_libraries(sample_2 -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

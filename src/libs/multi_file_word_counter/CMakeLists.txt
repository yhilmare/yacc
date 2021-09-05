cmake_minimum_required(VERSION 3.0.0)
project(word_count VERSION 0.1.0)

execute_process(COMMAND lex word_count.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(word_count SHARED ${SRC_DIR})

set_target_properties(word_count PROPERTIES OUTPUT_NAME "word_count")

target_link_libraries(word_count -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

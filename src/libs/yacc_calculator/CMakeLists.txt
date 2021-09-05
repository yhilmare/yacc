cmake_minimum_required(VERSION 3.0.0)
project(yacc_calculator VERSION 0.1.0)

execute_process(COMMAND yacc -d calculator.y COMMAND lex calculator.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_library(yacc_calculator SHARED ${SRC_DIR})

set_target_properties(yacc_calculator PROPERTIES OUTPUT_NAME "yacc_calculator")

target_link_libraries(yacc_calculator -ll -ly)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

cmake_minimum_required(VERSION 3.0.0)
project(calculator VERSION 0.1.0)

execute_process(COMMAND yacc -d calculator_gra.l COMMAND lex calculator_lex.l WORKING_DIRECTORY ../)

aux_source_directory(./ SRC_DIR)

add_executable(calculator y.tab.c lex.yy.c)

set_target_properties(calculator PROPERTIES OUTPUT_NAME "calculator")

target_link_libraries(calculator -ly -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

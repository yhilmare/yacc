cmake_minimum_required(VERSION 3.0.0)
project(yacc VERSION 0.1.0)
execute_process(COMMAND ./build.sh build WORKING_DIRECTORY ../)
aux_source_directory(./src SRC_DIR)
link_directories(./src/libs/sample1/build ./src/libs/sample2/build ./src/libs/sample3/build)

add_executable(yacc ${SRC_DIR})

target_link_libraries(yacc -lsimple_sentence -lsimple_lex_world_list -lsimple_lex -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

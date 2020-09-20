cmake_minimum_required(VERSION 3.0.0)
project(yacc VERSION 0.1.0)

aux_source_directory(./src SRC_DIR)
link_directories(./src/libs/sample1/build ./src/libs/sample2/build)

add_executable(yacc ${SRC_DIR})

target_link_libraries(yacc -l20200920_1 -l20200920 -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

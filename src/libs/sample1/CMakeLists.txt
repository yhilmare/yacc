cmake_minimum_required(VERSION 3.0.0)
project(sample_1 VERSION 0.1.0)

aux_source_directory(./ SAMPLE_1_DIR)

add_library(sample_1 SHARED ${SAMPLE_1_DIR})

set_target_properties(sample_1 PROPERTIES OUTPUT_NAME "20200920")

target_link_libraries(sample_1 -ll)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

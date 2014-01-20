###############################################################################
#  CMakeFile for project I3S-CNRS AR Project
#  Author: Arnaud TANGUY
###############################################################################

SET(PROJECT_NAME perceptron)
PROJECT(${PROJECT_NAME})
CMAKE_MINIMUM_REQUIRED(VERSION 2.4.6)
SET(CMAKE_INCLUDE_CURRENT_DIR TRUE)
SET(CMAKE_BUILD_TYPE Debug)

# Path to the cmake module path
set(CMAKE_MODULE_PATH "/home/arnaud/programmation/CMakeModules" ${CMAKE_CURRENT_SOURCE_DIR}/../../CMakeModules)

set(SRC src)
set(BIN_DIR bin)
set(DOC_DIR doc)

find_package(Eigen 3.0 REQUIRED)

set(SYSTEM_LIBS
    # pthread
    ${EIGEN_LIBRARIES}
)

set(EXTRA_LIBS
)

set(SYSTEM_INCLUDES
    ${EIGEN_INCLUDE_DIRS}
)

set( EXTRA_INCLUDES
)

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
set(CMAKE_CSS_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

set (CMAKE_CXX_FLAGS "-std=c++11 -O3 -march=native")


project(${PROJECT_NAME})
cmake_minimum_required(VERSION 2.6)
#set(CMAKE_CXX_FLAGS "-Wall -W -Werror -ansi -pedantic -g")


### DEFINE NEEDED SOURCES
#file(GLOB_RECURSE
#     SOURCES
#     ${SRC}/*.cpp
#)
set(SOURCES
${SRC}/main.cpp
)

message(STATUS "Building sources ${SOURCES}")

#### BUILD INSTRUCTIONS
include_directories (${SRC} ${SYSTEM_INCLUDES})
#link_directories( "/home/arnaud/programmation/PFE/private/OculusSDK/LibOVR" )

### CREATE LIBRARY
add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} ${SYSTEM_LIBS} ${EXTRA_LIBS} )



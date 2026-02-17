# set cmake ver
cmake_minimum_required(VERSION 3.15)
# project name, version, and language
project(LinuxDoom+ VERSION 0.1 LANGUAGES C)
# define executable name var
set(FINALEXEC linuxdoom-plus)
# use C17
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
# flags
if(WIN32 OR APPLE)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -Wall -DNORMALUNIX")
else()
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -Wall -DNORMALUNIX -DLINUX")
endif()
# find sdl2
find_package(SDL2 REQUIRED)
find_package(SDL2_mixer REQUIRED)
find_package(SDL2_net REQUIRED)
# files
# TEXTSCREEN
file(GLOB TXT_SOURCES "src/TEXTSCREEN/*.c")
add_library(textscreen STATIC ${TXT_SOURCES})
target_include_directories(textscreen
    SYSTEM PUBLIC
    src/TEXTSCREEN
    ${SDL2_INCLUDE_DIRS}
    ${SDL2_MIXER_INCLUDE_DIRS}
    ${SDL2_NET_INCLUDE_DIRS}
)
target_compile_options(textscreen PRIVATE
    ${SDL2_CFLAGS_OTHER}
    ${SDL2_MIXER_CFLAGS_OTHER}
    ${SDL2_NET_CFLAGS_OTHER}
)
# c sources
FILE(GLOB CSOURCES src/*.c)
# executable
add_executable(${FINALEXEC} ${CSOURCES})
# release and debug defines
target_compile_definitions(${FINALEXEC} PRIVATE 
    $<$<CONFIG:Release>:RELEASE>
    $<$<CONFIG:Debug>:DEBUG>
)
# include sdl2 directories and link it to the final executable
target_include_directories(${FINALEXEC} PRIVATE 
    ${SDL2_INCLUDE_DIRS} 
    ${SDL2_MIXER_INCLUDE_DIRS} 
    ${SDL2_NET_INCLUDE_DIRS}
)
target_link_libraries(${FINALEXEC} 
    textscreen 
    SDL2::SDL2 
    SDL2_mixer::SDL2_mixer 
    SDL2_net::SDL2_net
)

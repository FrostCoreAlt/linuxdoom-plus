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
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -Wall -DNORMALUNIX -DLINUX")
# files
# TEXTSCREEN
file(GLOB TXT_SOURCES "src/TEXTSCREEN/*.c")
add_library(textscreen STATIC ${TXT_SOURCES})
target_include_directories(textscreen PUBLIC src/TEXTSCREEN)
# c sources
FILE(GLOB CSOURCES src/*.c)
# executable
add_executable(${FINALEXEC} ${CSOURCES})
# find sdl2
find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 REQUIRED sdl2)
pkg_check_modules(SDL2_MIXER REQUIRED SDL2_mixer)
pkg_check_modules(SDL2_NET REQUIRED SDL2_net)
# include sdl2 directories and link it to the final executable
target_include_directories(${FINALEXEC} PRIVATE ${SDL2_INCLUDE_DIRS} ${SDL2_MIXER_INCLUDE_DIRS} ${SDL2_NET_INCLUDE_DIRS})
target_link_libraries(${FINALEXEC} textscreen ${SDL2_LIBRARIES} ${SDL2_MIXER_LIBRARIES} ${SDL2_NET_LIBRARIES})


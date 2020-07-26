cmake_minimum_required(VERSION 3.10)

project(main LANGUAGES CXX)
set(PROJECT_VERSION "1.6.1")

add_executable(main main.cc)
enable_testing()
add_test(test1 main 1)
add_test(test2 main 2)
add_test(test3 main 3)

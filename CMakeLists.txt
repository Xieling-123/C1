# 最低 CMake 版本
cmake_minimum_required(VERSION 3.10)

# 项目名
project(C案例)

# 设置 C 标准
set(CMAKE_C_STANDARD 11)


# 1、扫描对应文件夹的.c文件
# 扫描 src 目录下所有 .c 文件，创建对应的src
file(GLOB MAIN_SOURCES "src/*.c")
# 扫描 tests 目录下所有 .c 文件，创建对应的tests文件夹
file(GLOB TEST_SOURCES "tests/*.c")


# 2、对应的.c文件生成可执行的exe
# 生成主程序src
add_executable(main ${MAIN_SOURCES})

# 生成测试程序tests
add_executable(test ${TEST_SOURCES} src/math_utils.c)

# 让 test 也能用 math_utils 的 .h
target_include_directories(main PRIVATE src)
target_include_directories(test PRIVATE src)


# 使用方法：
Remove-Item -Recurse -Force build # 1. 清空旧的 build 目录（防止旧配置干扰）
cd C案例
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
mingw32-make
.\main.exe
.\test.exe

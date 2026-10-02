# 前面写好的头文件也就是说明书，零件也就是具体函数，具体调用main.c，自动测试函数，这里是具体的实现
# Makefile/CMakeLists.txt

# 自动化

# 1、定义编译器
CC=gcc
# 2、定义编译参数，解决GBK的问题
CFLAGS=-fexec-charset=GBK
# 3、定义最终目标，把main.c和math_utils.c排在一起生成main.exe

#默认目标 
main.exe:main.c math_utils.c 
		$(CC) $(CFLAGS) main.c math_utils.c -o main.exe
# 测试目标
test.exe:test_main.c math_utils.c 
		$(CC) $(CFLAGS) test_main.c math_utils.c -o test.exe

# 4、一键运行测试
test:test.exe
		.\test.exe

# 5、清理命令
clean:
		del main.exe test.exe

# 终端敲下
# mingw32-make
# .\main.exe
# mingw32-make test
# mingw32-make clean
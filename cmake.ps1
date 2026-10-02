# 使用方法：
Remove-Item -Recurse -Force build # 1. 清空旧的 build 目录（防止旧配置干扰）
# cd C案例
mkdir build
cd .\build
cmake -G "MinGW Makefiles" ..
mingw32-make
.\main.exe
.\test.exe
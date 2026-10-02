#include <stdio.h>
#include "math_utils.h"
// 定义断言函数
void assert_eq(int actual,int expected,const char* test_name){
    if (actual==expected)
    {
        printf("通过%s 期望 %d 实际%d\n",test_name,expected,actual);
    }else{
        printf("失败%s 期望%d 实际%d",test_name,expected,actual);
    }
    
}
// 测试的主函数
int main() {
    printf("===测试开始===\n");
    // 测试1
    assert_eq(add(3,9),12,"测试加法3+9\n");
    assert_eq(add(0,0),0,"测试加法0+0");
    assert_eq(add(-1,-1),-2,"测试加法-1-1\n");
    // 测试2
    assert_eq(multiply(3,9),27,"测试乘法3*9\n");
    assert_eq(multiply(0,0),0,"测试乘法0*0\n");
    assert_eq(multiply(-1,-1),1,"测试乘法-1*-1\n");
    printf("===测试结束===\n");

    return 0;
}
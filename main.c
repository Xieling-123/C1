#include <stdio.h>
#include "math_utils.h"
int main() {
    int x=10;
    int y=5;

    int sum=add(x,y);
    int product=multiply(x,y);

    printf("输出%d",sum);
    printf("输出%d",product);

    return 0;
}

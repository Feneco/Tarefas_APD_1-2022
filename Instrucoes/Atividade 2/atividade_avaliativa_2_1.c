#include <stdio.h>

int s(int k, int g, int h, int i, int j){
    int f;
    if(k==0){
        f=i+j;
        goto FINAL;
    } else if (k==1){
        f=g+h;
        goto FINAL;
    } else if (k==2){
        f=g-h;
        goto FINAL;
    } else if (k==3){
        f=i-j;
        goto FINAL;
    }

    FINAL: 
    return f;
}

int main(){
    int i;
    for(i=0;i<4;i++){
        printf("%d\n", s(i, 4, 5, 2, 3));
    }
    return 0;
}
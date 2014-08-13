clc;
clear all;

a=15750;
b=15725;
n=19939;

a1=a;
x1=mod(a1,n);
a2=a^2;
x2=mod(a2,n);
a3=x2^2;
x3=mod(a3,n);
a4_1=x3;
x4_1=mod(a4_1,n);
a4_2=x3^2;
x4_2=mod(a4_2,n);
x4_3=x4_1*x4_2;
x4=mod(x4_3,n);
a5_1=x4;
x5_1=mod(a5_1,n);
a5_2=x4^2;
x5_2=mod(a5_2,n);
a5_3=x5_1*x5_2;
x5=mod(a5_3,n);



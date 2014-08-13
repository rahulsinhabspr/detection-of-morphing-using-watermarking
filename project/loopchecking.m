
clc;
clear all;

A=[1 2 3 10; 4 5 6 11;7 8 9 12];
B=A;
r=20;
for i=1:1:2
    A(i,i)=A(i,i)+r;
end

C=[11 522];
for j=1:1:2
    B(j,j)=C(j);
end

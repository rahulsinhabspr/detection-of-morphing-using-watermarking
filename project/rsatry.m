
clear all;
clc;
clear;

n=3233;
x=zeros(1,17);
m=65;
for i=1:1:17
    x(i)=(m)^(i);
end

remain=zeros(1,17);
for j=1:1:17
   remain(j)=mod(x(j),n); 
end

x
remain

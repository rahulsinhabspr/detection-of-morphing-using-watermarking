clc;
clear all;
close all;


input=imread('rahul','jpeg');
% figure,imshow(input);
[s1 s2 s3]= size(input);

n=s1*s2;

for i=1:1:n
   q(i)= input(i);
   z(i)=mod(q(i),10);
end

znew=sum(z);

zq=mod(znew,10);

a=input(1:10,1:10);

for i=1:1:5
   b(i)=mod(a(i,i),zq);
   a(i,i)=a(i,i)-b(i);
   input(i,i)=a(i,i);
end

figure,imshow(input);
imwrite(input,'encrptedrahul.jpg');
clc;
clear all;
close all;


input=imread('19','jpeg');
[s1 s2 s3]= size(input);

n=s1*s2;

for i=1:1:n
   q(i)= input(i);
   z(i)=mod(q(i),10);
end

znew=sum(z);

zq=mod(znew,10);

for j=1:1:s1
   input(j,j)=input(j,j)+zq; 
end

figure,imshow(input);

morphed=imread('20','jpeg');
[s1new s2new s3new]= size(morphed);

n=s1new*s2new;

for i=1:1:n
   qnew(i)= morphed(i);
   znew(i)=mod(qnew(i),10);
end

z2new=sum(znew);

zqnew=mod(z2new,10);

for j=1:1:s1
   morphed(j,j)=morphed(j,j)+zq; 
end
figure,imshow(morphed)

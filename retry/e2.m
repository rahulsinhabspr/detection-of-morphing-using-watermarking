

clc;
clear all;
close all;

%Read an Image

input1=imread('rahul','jpeg');
input2=rgb2gray(input1);
inputb = rgb2gray(input1);

[s1 s2]=size(input2);
n=s1*s2;

%Calculating modulus of every pixel with 10
for i=1:1:n
   z(i)=mod(input2(i),10);
end

%Calculating the sum
znew=sum(z);

%Encryption Value
enc=mod(znew,10); 

%Modifing pixel value throughout the image

for i=1:1:s1
   for j=1:1:s2
        b=mod(input2(i,j),enc);
        newimage(i,j)=input2(i,j)-b;
   end
end

figure,imshow(newimage,[]);



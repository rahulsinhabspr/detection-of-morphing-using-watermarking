clc;
clear all;
close all;

limewatch=imread('limewatch','jpeg');
limewatcho=imread('limewatch','jpeg');
[s1 s2 s3]= size(limewatcho);

n=s1*s2;

for i=1:1:n
   q(i)= limewatcho(i);
   z(i)=mod(q(i),10);
end

znew=sum(z);

zq=mod(znew,10);

for j=1:1:s1
   limewatcho(j,j)=limewatcho(j,j)+zq; 
end
figure,imshow(limewatch)
figure,imshow(limewatcho)
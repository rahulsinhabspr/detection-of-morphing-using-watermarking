

clc;
clear all;
close all;

%Read an Image

input1=imread('marykom','png');
input2=rgb2gray(input1);
inputb = rgb2gray(input1);

[s1 s2]=size(input2);
n=s1*s2;

%pixel location where modification will be done

n1=round(s1/2);
n2=round(s2/2);

n3=round(s1/4);
n4=round(s2/4);

n5=round(.75*s1);
n6=round(.75*s2);

%Calculating modulus of every pixel with 10
for i=1:1:n
   z(i)=mod(input2(i),10);
end

%Calculating the sum
znew=sum(z);

%Encryption Value
enc=mod(znew,10); 

q = zeros(s1,s2);
%Encrypt the 1
b1=mod(input2(1,1),enc);
input2(1,1)=input2(1,1)-b1;
q(1,1) = input2(1,1);

%Encrypt pixel 2
b2=mod(input2(1,n4),enc);
input2(1,n4)=input2(1,n4)-b2;
q(1,n4) = input2(1,n4);


%Encrypt pixel 3
b3=mod(input2(1,n2),enc);
input2(1,n2)=input2(1,n2)-b3;
q(1,n2) = input2(1,n2);


%Encrypt pixel 4
b4=mod(input2(1,n6),enc);
input2(1,n6)=input2(1,n6)-b4;
q(1,n6) = input2(1,n6);


%Encrypt pixel 5
b5=mod(input2(1,s2),enc);
input2(1,s2)=input2(1,s2)-b5;
q(1,s2) = input2(1,s2);


%Encrypt the 6
b6=mod(input2(n3,1),enc);
input2(n3,1)=input2(n3,1)-b6;
q(n3,1) = input2(n3,1);

%Encrypt pixel 7
b7=mod(input2(n3,n4),enc);
input2(n3,n4)=input2(n3,n4)-b7;
q(n3,n4) = input2(n3,n4);


%Encrypt pixel 8
b8=mod(input2(n3,n2),enc);
input2(n3,n2)=input2(n3,n2)-b8;
q(n3,n2) = input2(n3,n2);


%Encrypt pixel 9
b9=mod(input2(n3,n6),enc);
input2(n3,n6)=input2(n3,n6)-b9;
q(n3,n6) = input2(n3,n6);


%Encrypt pixel 10
b10=mod(input2(n3,s2),enc);
input2(n3,s2)=input2(n3,s2)-b10;
q(n3,s2) = input2(n3,s2);



%Encrypt the 11
b11=mod(input2(n1,1),enc);
input2(n1,1)=input2(n1,1)-b11;
q(n1,1) = input2(n1,1);

%Encrypt pixel 12
b12=mod(input2(n1,n4),enc);
input2(n1,n4)=input2(n1,n4)-b12;
q(n1,n4) = input2(n1,n4);


%Encrypt pixel 13
b13=mod(input2(n1,n2),enc);
input2(n1,n2)=input2(n1,n2)-b13;
q(n1,n2) = input2(n1,n2);


%Encrypt pixel 14
b14=mod(input2(n1,n6),enc);
input2(n1,n6)=input2(n1,n6)-b14;
q(n1,n6) = input2(n1,n6);


%Encrypt pixel 15
b15=mod(input2(n1,s2),enc);
input2(n1,s2)=input2(n1,s2)-b15;
q(n1,s2) = input2(n1,s2);


%Encrypt the 16
b16=mod(input2(n5,1),enc);
input2(n5,1)=input2(n5,1)-b16;
q(n5,1) = input2(n5,1);

%Encrypt pixel 17
b17=mod(input2(n5,n4),enc);
input2(n5,n4)=input2(n5,n4)-b17;
q(n5,n4) = input2(n5,n4);


%Encrypt pixel 18
b18=mod(input2(n5,n2),enc);
input2(n5,n2)=input2(n5,n2)-b18;
q(n5,n2) = input2(n5,n2);


%Encrypt pixel 19
b19=mod(input2(n5,n6),enc);
input2(n5,n6)=input2(n5,n6)-b19;
q(n5,n6) = input2(n5,n6);


%Encrypt pixel 20
b20=mod(input2(n5,s2),enc);
input2(n5,s2)=input2(n5,s2)-b20;
q(n5,s2) = input2(n5,s2);




%Encrypt the 21
b21=mod(input2(s1,1),enc);
input2(s1,1)=input2(s1,1)-b21;
q(s1,1) = input2(s1,1);

%Encrypt pixel 22
b22=mod(input2(s1,n4),enc);
input2(s1,n4)=input2(s1,n4)-b22;
q(s1,n4) = input2(s1,n4);


%Encrypt pixel 23
b23=mod(input2(s1,n2),enc);
input2(s1,n2)=input2(s1,n2)-b23;
q(s1,n2) = input2(s1,n2);


%Encrypt pixel 24
b24=mod(input2(s1,n6),enc);
input2(s1,n6)=input2(s1,n6)-b24;
q(s1,n6) = input2(s1,n6);


%Encrypt pixel 25
b25=mod(input2(s1,s2),enc);
input2(s1,s2)=input2(s1,s2)-b25;
q(s1,s2) = input2(s1,s2);



r=[b1 b2 b3 b4 b5;
    b6 b7 b8 b9 b10;
    b11 b12 b13 b14 b15;
    b16 b17 b18 b19 b20;
    b21 b22 b23 b24 b25];
% 
% figure,imshow(input2,[]);
% figure,imshow(q,[]);

newrow=zeros(1,(s2+1));

for i=1:1:s2
    newrow(1,i)=input2(s1,i);
end


for j=1:1:5
   newrow(1,(1+j))=r(1,j);
   newrow(1,(n4+j))=r(2,j);
   newrow(1,(n2+j))=r(3,j);
   newrow(1,(n6+j))=r(4,j);
   newrow(1,(s2-j))=r(5,j);
end

newcol=zeros((s1+1),1);

for i=1:1:s1
    newcol(i,1)=input2(i,s2);
end

for j=1:1:5
   newcol((1+j),1)=r(1,j);
   newcol((n3+j),1)=r(2,j);
   newcol((n1+j),1)=r(3,j);
   newcol((n5+j),1)=r(4,j);
   newcol((s1-j),1)=r(5,j);
end


newimage=[input2;zeros(1,s2)];

newimage2=[newimage,zeros((s1+1),1)];
newimage2((s1+1),(s2+1))=255;

for ij=1:1:s1
   newimage(ij,(s2+1))=newcol(ij,1);
end


for iji=1:1:s2
   newimage((s1+1),iji)=newrow(1,iji); 
end


newimage((s1+1),1)=255;
newimage((s1+1),n2)=255;
newimage((s1+1),n4)=255;
newimage((s1+1),n6)=255;
newimage((s1+1),s2)=255;

newimage(1,(s2+1))=255;
newimage(n1,(s2+1))=255;
newimage(n3,(s2+1))=255;
newimage(n5,(s2+1))=255;
newimage(s1,(s2+1))=255;


figure,imshow(newimage,[]);
imwrite(newimage,'encryptedmarykom.png');



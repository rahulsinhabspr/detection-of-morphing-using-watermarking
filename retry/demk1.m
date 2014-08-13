
clc;
clear all;
close all;

input=imread('encryptedmarykom','png');
% input=rgb2gray(input);


[s1,s2]=size(input);
input1=input(1:(s1-1),1:(s2-1));

for i=1:1:(s2-1)
   col(1,i)=input(s1,i); 
end

z=zeros(1,(s2-1));
for i=1:1:(s2-1)
   if(col(1,i)==255)
       z(i)=i;
   end
end

p=zeros(1,5);
p=find(z);

for i=1:1:(s1-1)
   row(i,1)=input(i,s2); 
end

z2=zeros(1,(s1-1));
for i=1:1:(s1-1)
   if(row(i,1)==255)
       z2(i)=i;
   end
end

q=zeros(1,5);
q=find(z2);

%desidered pixel location


for j1=1:1:max(size(q))
    for j2=1:1:max(size(p))
       dp(j1,j2)=input1(q(j1),p(j2)); 
    end
end

l=0;
for j3=1:1:max(size(dp))
    for j4=1:1:max(size(dp))
        l=l+1;
        for k=1:1:9;
            t = mod(dp(j3,j4),(k+1));
             if t == 0
                 div(l,k)=k+1;  
             end
        end
    end
end

nw=0;
for j3=1:1:max(size(dp))
    for j4=1:1:max(size(dp))
       nw=nw+1;
        new(nw,1)=dp(j3,j4);
    end
end

new_div=[new,div];

[m n]=size(div);

p3=[2 3 4 5 6 7 8 9 10];

nn=m*n;

    c2=0;
    c3=0;
   c4=0;
   c5=0;
   c6=0;
   c7=0;
   c8=0;
   c9=0;
   c10=0;
   
for ij=1:1:nn

  if p3(1)==div(ij)
       c2=c2+1;
   elseif p3(2)==div(ij)
       c3=c3+1;
   elseif p3(3)==div(ij)
       c4=c4+1;
   elseif p3(4)==div(ij)
       c5=c5+1;
   elseif p3(5)==div(ij)
       c6=c6+1;
   elseif p3(6)==div(ij)
       c7=c7+1;
   elseif p3(7)==div(ij)
       c8=c8+1;
   elseif p3(8)==div(ij)
       c9=c9+1;
   elseif p3(9)==div(ij)
       c10=c10+1;
   end
end

sd=[c2,c3,c4,c5,c6,c7,c8,c9,c10];

qnew=max(sd);

[p1,q1]=size(sd);

sdn=zeros(p1,q1);

for i=1:1:(p1*q1)
  
    if qnew ==sd(i)
        sdn(i)=p3(i);
    end
end

k=1;
for i=1:1:(p1*q1)
    if sdn(i)~= 0
       sdnn(k)=sdn(i);
       k=k+1;
    end
end

%finding remainder

maxp=max(size(p));
maxq=max(size(q));
pq=max(maxp,maxq);

for i=1:1:pq
   a1(i)=col(1,p(1)+i); 
   b1(i)=row(q(1)+i,1);
   
   a2(i)=col(1,p(2)+i); 
   b2(i)=row(q(2)+i,1);
   
   
   a3(i)=col(1,p(3)+i); 
   b3(i)=row(q(3)+i,1);
   
   
   a4(i)=col(1,p(4)+i); 
   b4(i)=row(q(4)+i,1);
   
   
   a5(i)=col(1,p(5)-i); 
   b5(i)=row(q(5)-i,1);
   
  end

input2=input1;

for i=1:1:pq
input2(q(1),p(i))=input2(q(1),p(i))+a1(i);
input2(q(2),p(i))=input2(q(2),p(i))+a2(i);
input2(q(3),p(i))=input2(q(3),p(i))+a3(i);
input2(q(4),p(i))=input2(q(4),p(i))+a4(i);
input2(q(5),p(i))=input2(q(5),p(i))+a5(i);
end

w=input2-input1;
% figure,imshow(w,[]);

[w1,w2]=size(input2);
nn=w1*w2;
for i=1:1:nn
   zd(i)=mod(input2(i),10);
end

znewd=sum(zd);
encd=mod(znewd,10);

for j=1:1:max(size(sdnn))
    if sdnn(j)== encd
        disp('image is not morphed');
    else
        disp('image is morphed');
    end
end

% Output figure
figure,imshow(input,[]);
title('Given Input figure');
figure,imshow(w,[]);
title('Position of watermarking');





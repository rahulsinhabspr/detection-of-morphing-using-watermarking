
clc;
clear all;
close all;

input=imread('newrahulresize','png');
input=rgb2gray(input);
inputb=imread('newrahul','png');

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

p=ones(1,5);
% p=find(z);

for i=1:1:(s1-1)
   row(i,1)=input(i,s2); 
end

z2=zeros(1,(s1-1));
for i=1:1:(s1-1)
   if(row(i,1)==255)
       z2(i)=i;
   end
end

q=ones(1,5);
% q=find(z2);

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

[s1d,s2d]=size(div);

nn=s1d*s2d;   

   p1=1;c1=1;
   p2=2;c2=1;
   p3=3;c3=1;
   p4=4;c4=1;
   p5=5;c5=1;
   p6=6;c6=1;
   p7=7;c7=1;
   p8=8;c8=1;
   p9=9;c9=1;
   p10=10;c10=1;
   
for ij=1:1:nn

   if p1==div(ij)
       c1=c1 + 1;
   elseif p2==div(ij)
       c2=c2+1;
   elseif p3==div(ij)
       c3=c3+1;
   elseif p4==div(ij)
       c4=c4+1;
   elseif p5==div(ij)
       c5=c5+1;
   elseif p6==div(ij)
       c6=c6+1;
   elseif p7==div(ij)
       c7=c7+1;
   elseif p8==div(ij)
       c8=c8+1;
   elseif p9==div(ij)
       c9=c9+1;
   elseif p10==div(ij)
       c10=c10+1;
   end
end

sd=[c1,c2,c3,c4,c5,c6,c7,c8,c9,c10];

qnew=max(sd);

if qnew==c1
    encryptedvalue=p1;
elseif qnew==c2
    encryptedvalue=p2;
elseif qnew==c3
    encryptedvalue=p3;
elseif qnew==c4
    encryptedvalue=p4;
elseif qnew==c5
    encryptedvalue=p5;
elseif qnew==c6
    encryptedvalue=p6;
elseif qnew==c7
    encryptedvalue=p7;
elseif qnew==c8
    encryptedvalue=p8;
elseif qnew==c9
    encryptedvalue=p9;
elseif qnew==c10
    encryptedvalue=p10;
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

if encryptedvalue== encd
    disp('image is not morphed');
else
    disp('image is morphed');
end


% Output figure
figure,imshow(input,[]);
title('Given Input figure');
figure,imshow(w,[]);
title('Position of watermarking');





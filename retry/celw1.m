clc;
clear all;
close all;
%Read an image
% input1=imread('limewatch','jpeg');
% inputb=imread('limewatch','jpeg');
% [s1,s2,s3]=size(input1);
% n=s1*s2;
% %pixel location where modification will be done
% n1=round(s1/2);
% n2=round(s2/2);
% n3=round(s1/4);
% n4=round(s2/4);
% n5=round(.75*s1);
% n6=round(.75*s2);
% %Calculating modulus of every pixel with 10
% for i=1:1:s1
%     for j=1:1:s2
%     z(i,j)=mod(input1(i,j),10);
%     end
% end
% %Calculating the sum
% znew1=sum(z);
% znew2=sum(znew1);
% %encryption value
% enc=mod(znew2,10);
% q=zeros(s1,s2);
% %Encrypt the 1
% b1=mod(input1(1,1),enc);
% input1(1,1)=input1(1,1)-b1;
% q(1,1) = input1(1,1);
% 
% %Encrypt pixel 2
% b2=mod(input1(1,n4),enc);
% input1(1,n4)=input1(1,n4)-b2;
% q(1,n4) = input1(1,n4);
% %Encrypt pixel 3
% b3=mod(input1(1,n2),enc);
% input1(1,n2)=input1(1,n2)-b3;
% q(1,n2) = input1(1,n2);
% %Encrypt pixel 4
% b4=mod(input1(1,n6),enc);
% input1(1,n6)=input1(1,n6)-b4;
% q(1,n6) = input1(1,n6);
% %Encrypt pixel 5
% b5=mod(input1(1,s2),enc);
% input1(1,s2)=input1(1,s2)-b5;
% q(1,s2) = input1(1,s2);
% %Encrypt the 6
% b6=mod(input1(n3,1),enc);
% input1(n3,1)=input1(n3,1)-b6;
% q(n3,1) = input1(n3,1);
% %Encrypt pixel 7
% b7=mod(input1(n3,n4),enc);
% input1(n3,n4)=input1(n3,n4)-b7;
% q(n3,n4) = input1(n3,n4);
% %Encrypt pixel 8
% b8=mod(input1(n3,n2),enc);
% input1(n3,n2)=input1(n3,n2)-b8;
% q(n3,n2) = input1(n3,n2);
% %Encrypt pixel 9
% b9=mod(input1(n3,n6),enc);
% input1(n3,n6)=input1(n3,n6)-b9;
% q(n3,n6) = input1(n3,n6);
% %Encrypt pixel 10
% b10=mod(input1(n3,s2),enc);
% input1(n3,s2)=input1(n3,s2)-b10;
% q(n3,s2) = input1(n3,s2);
% %Encrypt the 11
% b11=mod(input1(n1,1),enc);
% input1(n1,1)=input1(n1,1)-b11;
% q(n1,1) = input1(n1,1);
% %Encrypt pixel 12
% b12=mod(input1(n1,n4),enc);
% input1(n1,n4)=input1(n1,n4)-b12;
% q(n1,n4) = input1(n1,n4);
% %Encrypt pixel 13
% b13=mod(input1(n1,n2),enc);
% input1(n1,n2)=input1(n1,n2)-b13;
% q(n1,n2) = input1(n1,n2);
% %Encrypt pixel 14
% b14=mod(input1(n1,n6),enc);
% input1(n1,n6)=input1(n1,n6)-b14;
% q(n1,n6) = input1(n1,n6);
% %Encrypt pixel 15
% b15=mod(input1(n1,s2),enc);
% input1(n1,s2)=input1(n1,s2)-b15;
% q(n1,s2) = input1(n1,s2);
% %Encrypt the 16
% b16=mod(input1(n5,1),enc);
% input1(n5,1)=input1(n5,1)-b16;
% q(n5,1) = input1(n5,1);
% %Encrypt pixel 17
% b17=mod(input1(n5,n4),enc);
% input1(n5,n4)=input1(n5,n4)-b17;
% q(n5,n4) = input1(n5,n4);
% %Encrypt pixel 18
% b18=mod(input1(n5,n2),enc);
% input1(n5,n2)=input1(n5,n2)-b18;
% q(n5,n2) = input1(n5,n2);
% %Encrypt pixel 19
% b19=mod(input1(n5,n6),enc);
% input1(n5,n6)=input1(n5,n6)-b19;
% q(n5,n6) = input1(n5,n6);
% %Encrypt pixel 20
% b20=mod(input1(n5,s2),enc);
% input1(n5,s2)=input1(n5,s2)-b20;
% q(n5,s2) = input1(n5,s2);
% %Encrypt the 21
% b21=mod(input1(s1,1),enc);
% input1(s1,1)=input1(s1,1)-b21;
% q(s1,1) = input1(s1,1);
% %Encrypt pixel 22
% b22=mod(input1(s1,n4),enc);
% input1(s1,n4)=input1(s1,n4)-b22;
% q(s1,n4) = input1(s1,n4);
% %Encrypt pixel 23
% b23=mod(input1(s1,n2),enc);
% input1(s1,n2)=input1(s1,n2)-b23;
% q(s1,n2) = input1(s1,n2);
% %Encrypt pixel 24
% b24=mod(input1(s1,n6),enc);
% input1(s1,n6)=input1(s1,n6)-b24;
% q(s1,n6) = input1(s1,n6);
% %Encrypt pixel 25
% b25=mod(input1(s1,s2),enc);
% input1(s1,s2)=input1(s1,s2)-b25;
% q(s1,s2) = input1(s1,s2);
% r=[b1 b2 b3 b4 b5;
%     b6 b7 b8 b9 b10;
%     b11 b12 b13 b14 b15;
%     b16 b17 b18 b19 b20;
%     b21 b22 b23 b24 b25];
% % new row
% newrow=zeros(1,(s2+1));
% for i=1:1:s2
%    newrow(1,i)=input1(s1,i); 
% end
% for j=1:1:5
%    newrow(1,(1+j))=r(1,j);
%    newrow(1,(n4+j))=r(2,j);
%    newrow(1,(n2+j))=r(3,j);
%    newrow(1,(n6+j))=r(4,j);
%    newrow(1,(s2-j))=r(5,j);
% end
% newcol=zeros((s1+1),1);
% for i=1:1:s1
%     newcol(i,1)=input1(i,s2);
% end
% for j=1:1:5
%    newcol((1+j),1)=r(1,j);
%    newcol((n3+j),1)=r(2,j);
%    newcol((n1+j),1)=r(3,j);
%    newcol((n5+j),1)=r(4,j);
%    newcol((s1-j),1)=r(5,j);
% end
% newimage=[input1;zeros(1,s2,3)];
% newimage=[newimage,zeros((s1+1),1,3)];
% newimage((s1+1),(s2+1),3)=255;
% for ij=1:1:s1
%    newimage(ij,(s2+1))=newcol(ij,1);
% end
% for iji=1:1:s2
%    newimage((s1+1),iji)=newrow(1,iji); 
% end
% newimage((s1+1),1)=255;
% newimage((s1+1),n2)=255;
% newimage((s1+1),n4)=255;
% newimage((s1+1),n6)=255;
% newimage((s1+1),s2)=255;
% newimage(1,(s2+1))=255;
% newimage(n1,(s2+1))=255;
% newimage(n3,(s2+1))=255;
% newimage(n5,(s2+1))=255;
% newimage(s1,(s2+1))=255;
% 
% figure,imshow(newimage,[]);
% imwrite(newimage,'newlivecoluredlimewatch.png');
% 



inputp=imread('morphednewlivecoluredlimewatch','png');
[s11,s22,s33]=size(inputp);
s111=s11-1;
s222=s22-1;
input3=zeros(s111,s222,s33);
input3=inputp(1:s111,1:s222,1:s33);
for i=1:1:s222
   col(1,i)=inputp(s11,i); 
end

zc=zeros(1,s222);
for i=1:1:s222
   if(col(1,i)==255)
       zc(i)=i;
   end
end
p=zeros(1,5);
p=find(zc);

for i=1:1:s111
   row(i,1)=inputp(i,s22); 
end

z2r=zeros(1,s111);
for i=1:1:s111
   if(row(i,1)==255)
       z2r(i)=i;
   end
end

q=zeros(1,5);
q=find(z2r);

%desidered pixel location


for j1=1:1:max(size(q))
    for j2=1:1:max(size(p))
       dp(j1,j2)=input3(q(j1),p(j2)); 
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

k3=1;
for i=1:1:(p1*q1)
    if sdn(i)~= 0
       sdnn(k3)=sdn(i);
       k3=k3+1;
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

for i=1:1:pq
input3(q(1),p(i))=input3(q(1),p(i))+a1(i);
input3(q(2),p(i))=input3(q(2),p(i))+a2(i);
input3(q(3),p(i))=input3(q(3),p(i))+a3(i);
input3(q(4),p(i))=input3(q(4),p(i))+a4(i);
input3(q(5),p(i))=input3(q(5),p(i))+a5(i);
end

for i=1:1:s111
    for j=1:1:s222
        zdd(i,j)=mod(input3(i,j),10);
    end
end

znewdd=sum(zdd);
znewddd=sum(znewdd);

encd=mod(znewddd,10);


for j=1:1:max(size(sdnn))
    if sdnn(j)== encd
        disp('image is not morphed');
    else
        disp('image is morphed');
    end
end








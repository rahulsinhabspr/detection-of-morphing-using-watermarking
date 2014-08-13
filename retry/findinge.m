
clc;
clear;
clear all;
close all;


div=[2     3     4     0     6     0     8     0     0;
    2     0     4     0     0     0     8     0     0;
     2     0     4     0     0     7     8     0     0;
     2     0     4     0     0     7     8     0     0;
     2     3     4     0     6     0     8     9     0;
     2     0     4     0     0     7     8     0     0;
     2     0     4     5     0     0     8     0    10;
     0     0     0     0     0     0     0     0     0;
     2     3     4     0     6     0     8     9     0;
     2     3     4     5     6     0     8     0    10;
     2     0     4     0     0     7     8     0     0;
     2     0     4     0     0     0     8     0     0;
     2     0     4     5     0     0     8     0    10;
     2     0     4     0     0     0     8     0     0;
     2     0     4     0     0     0     8     0     0;
     2     0     4     5     0     0     8     0    10;
     2     3     4     5     6     0     8     0    10;
     0     0     0     0     0     0     0     0     0;
     2     3     4     5     6     0     8     0    10;
     2     3     4     5     6     0     8     0    10;
     2     0     4     0     0     0     8     0     0;
     2     3     4     5     6     0     8     0    10;
     2     3     4     0     6     7     8     0     0;
     2     3     4     0     6     0     8     9     0;
     2     3     4     0     6     7     8     0     0
];

[m n]=size(div);

p=[2 3 4 5 6 7 8 9 10];

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

  if p(1)==div(ij)
       c2=c2+1;
   elseif p(2)==div(ij)
       c3=c3+1;
   elseif p(3)==div(ij)
       c4=c4+1;
   elseif p(4)==div(ij)
       c5=c5+1;
   elseif p(5)==div(ij)
       c6=c6+1;
   elseif p(6)==div(ij)
       c7=c7+1;
   elseif p(7)==div(ij)
       c8=c8+1;
   elseif p(8)==div(ij)
       c9=c9+1;
   elseif p(9)==div(ij)
       c10=c10+1;
   end
end

sd=[c2,c3,c4,c5,c6,c7,c8,c9,c10];

qnew=max(sd);

[p1,q1]=size(sd);

sdn=zeros(p1,q1);

for i=1:1:(p1*q1)
  
    if qnew ==sd(i)
        sdn(i)=p(i);
    end
end

k=1;
for i=1:1:(p1*q1)
    if sdn(i)~= 0
       sdnn(k)=sdn(i);
       k=k+1;
    end
end

% f=find(sdn);
% k=max(size(f));
% 
% for op=1=1:1:k
%    e(1,op)=sdn(1,f(op)); 
% end
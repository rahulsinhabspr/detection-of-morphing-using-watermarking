
clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 12;

%Take original image as input in matlab which convert can image into matrix.
inputimage=imread('rahul','jpg');
inputimage=rgb2gray(inputimage);

%Calculate the size of input image matrix.
[s1,s2]=size(inputimage)


% Searching and Calculation for p and q 
M=s1;
m=M:-1:(M-20);
ml=length(m);
mfirst=m(1);
mlast=m(ml);

for j=0:(mfirst-mlast) 
      Prime=1;
      for i=2:((mfirst-j)/2)
          if mod((mfirst-j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1 
          p=m(j+1)
          break;
      else
     
      end
  end



N=s2;
n11=N:1:(N+20);
nl=length(n11);
nfirst=n11(1);
nlast=n11(nl);

for j=0:(nlast-nfirst) 
      Prime=1;
      for i=2:((nfirst+j)/2)
          if mod((nfirst+j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1
          q=n11(j+1)
          break;
      else
     
      end
end
  
%Calculation for n
n11=p*q;

n11

tot=(p-1)*(q-1);

% Calculation for e

 x=2;e=1;

while x > 1

    e=e+1;

    x=gcd(tot,e);

end
e
% Calculation for d

ii=1;
r=1;
while r > 0
k=(tot*ii)+1;
r=mod(k,e);
ii=ii+1;
end
d=k/e










clc;
clear all;
inputimage=imread('rahul','jpeg');
inputimage=rgb2gray(inputimage);
[s1,s2]=size(inputimage);
F=fftshift(fft2(inputimage));
r=abs(F);
e3=size(r);
dr=diag(r);
[s1d,s2d] = size(dr);
sd=max(s1d,s2d);
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
          p=m(j+1);
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
          q=n11(j+1);
          break;
      else
     end
end
n=p*q;
tot=(p-1)*(q-1);
x=2;e=1;
while x > 1
    e=e+1;
    x=gcd(tot,e);
end
ii=1;
r=1;
while r > 0
k=(tot*ii)+1;
r=mod(k,e);
ii=ii+1;
end
d=k/e;
for ij=1:1:sd
    y(ij)=dr(ij);
    x1=mod(y(ij),n);
    x2=mod((y(ij)^2),n);
    x3=mod((x2)^2,n);
    x4=mod((x1*x3),n);
    z(ij)=x4;
end
for ji=1:sd
		 r(ji,ji)=z(ji);
end
invf=r.*exp(j*angle(F));
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);
figure,imshow(imgae);
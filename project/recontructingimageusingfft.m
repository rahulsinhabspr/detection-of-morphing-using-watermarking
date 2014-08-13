clc;
clear all;

inputimage=imread('rahul','jpeg');
inputimage=rgb2gray(inputimage);

%Calculate the size of input image matrix.
[s1,s2]=size(inputimage);

%Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
F=fftshift(fft2(inputimage));

%Calculate the magnitude of FFT of input image i.e Fm or r
r=abs(F);
e3=size(r);
%Calculate the phase of FFT of input image i.e Fp or theta
theta=angle(F);
e4=size(theta);
%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
dr=diag(r);

%Calculating the size of the principal diagonal element of magnitude of input image(FFT of input image).
[s1d,s2d] = size(dr);

%Calculating total number of element in the principal diagonal element of magnitude of input image(FFT of input image).
sd=max(s1d,s2d);

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
n=p*q;

n

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


%encrypting the message. 

%Public key are e and n.
%message is diagonal_of_amplitude_of_inputimage

for ij=1:1:sd
    y(ij)=dr(ij);
    x1=mod(y(ij),n);
    x2=mod((y(ij)^2),n);
    x3=mod((x2)^2,n);
    x4=mod((x1*x3),n);
    z(ij)=x4;

end

%embedding encrypted data in magnitude plot.
% 
% for ji=1:sd
% 		 r(ji,ji)=z(1,ji);
% end



invf=r.*exp(j*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);

figure,imshow(imgae);
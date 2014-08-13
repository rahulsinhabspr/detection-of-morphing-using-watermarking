clc;
clear all;
close all;

inputimage=imread('limewatch','jpeg');
inputimage=rgb2gray(inputimage);

%Calculate the size of input image matrix.
[s1,s2]=size(inputimage);
%Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
F=fftshift(fft2(inputimage));
%Calculate the magnitude of FFT of input image i.e Fm or r
r=abs(F);
%Calculate the phase of FFT of input image i.e Fp or theta
theta=angle(F);
%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
dr=diag(r);
%Calculating the size of the principal diagonal element of magnitude of input image(FFT of input image).
[s1d,s2dnew] = size(dr);
%Calculating total number of element in the principal diagonal element of magnitude of input image(FFT of input image).
sd=max(s1d,s2dnew);
% Searching for p.
p=seaching_for_p(s1);
% Searching for q.
q=seaching_for_q(s2);
%Calculation for n
[n,tot]=Calculation_for_n(p,q);
% Calculation for e
e=Calculation_for_e(tot);
% Calculation for d
d=Calculation_for_d(tot,e);
%encrypting the message. 

for eni=1:1:sd
    M=dr(eni);
z(eni) = encryption(M,n,e);
end
%embedding encrypted data in magnitude plot.
re=embedding_encrypted_data(sd,r,z);
%Inverse Fourier Transform
invf=re.*exp(j*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);
%Producing Output
figure,imshow(inputimage);
title('Input Image');
figure,imshow(imgae);
title('watermarking throughout the principal diagonal of image using rsa');

sub=re-r;

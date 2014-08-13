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
dr=diag(r);
%Calculate the phase of FFT of input image i.e Fp or theta
theta=angle(F);
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
sd=10;
for i=1:1:sd
    z(i) = encryption(dr(i),n,e);
end
%embedding encrypted data in magnitude plot.
re=embedding_encrypted_data(sd,r,z/10);
%Inverse Fourier Transform
invf=re.*exp(j*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);
%Producing Output
figure,imshow(inputimage);
title('Input Image');
figure,imshow(imgae);
title('watermarking through 10 principal diagonal element of image using rsa when encrypted value is one tenth');

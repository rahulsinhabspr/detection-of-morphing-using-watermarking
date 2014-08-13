clc;
clear all;
close all;

wimage=imread('output_encrypted_image','jpeg');


%Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
FW=fftshift(fft2(wimage));
%Calculate the magnitude of FFT of input image i.e Fm or r
r=abs(FW);
or=r;
%Calculate the phase of FFT of input image i.e Fp or theta
theta=angle(FW);
%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
dr=diag(r);
%Calculating the size of the principal diagonal element of magnitude of input image(FFT of input image).
[s1d,s2d] = size(dr);
%Calculating total number of element in the principal diagonal element of magnitude of input image(FFT of input image).
sd=max(s1d,s2d);

d=15725;
n=19939;

ori=de(d,sd,dr,n);
dect=embedding_original_magnitude(sd,r,ori);

rnew=dect;


dinvf=rnew.*exp(1i*theta);
dimg=ifftshift(dinvf);
dimga=ifft2(dimg);
dimgae=uint8(dimga);

figure,imshow(dimgae);

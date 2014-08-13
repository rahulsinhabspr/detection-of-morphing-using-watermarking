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
%Calculating where encryption is to be done
s2e=floor(s2);
for ie2=1:1:s1
   rne(ie2)=r(ie2,s2e); 
end
clc;
clear all;
close all;

inputimage=imread('rahul','jpeg');
inputimage=rgb2gray(inputimage);

%Calculate the size of input image matrix.
[s1,s2]=size(inputimage);
%Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
F=fftshift(fft2(inputimage));
%Calculate the magnitude of FFT of input image i.e Fm or r
r=abs(F);
or=r;
%Calculate the phase of FFT of input image i.e Fp or theta
theta=angle(F);
%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
dr=diag(r);
%Calculating the size of the principal diagonal element of magnitude of input image(FFT of input image).
[s1d,s2d] = size(dr);
%Calculating total number of element in the principal diagonal element of magnitude of input image(FFT of input image).
sd=max(s1d,s2d);
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
z=encrypting_the_message(e,sd,dr,n);
%embedding encrypted data in magnitude plot.
re=embedding_encrypted_data(sd,r,z);


sub=re-or;

invf=re.*exp(1i*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);

figure,imshow(imgae);
figure,imshow(inputimage);

ori=de(d,sd,z,n);

sub2=ori-dr;
dect=embedding_original_magnitude(sd,r,ori);

rnew=dect;


dinvf=rnew.*exp(1i*theta);
dimg=ifftshift(dinvf);
dimga=ifft2(dimg);
dimgae=uint8(dimga);

figure,imshow(dimgae);
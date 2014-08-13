clc;
clear all;

input=imread('rahul','jpeg');
input=rgb2gray(input);
F=fft2(input);
FS=fftshift(F);
r=abs(FS);
theta=angle(FS);
FM=r .* (i*theta);
newimage=ifft2(FM);
newimage=fftshift(newimage);
newimage=uint8(real(newimage));
figure,imshow(newimage);

nimage=ifft2(F);
nimage=uint8(real(nimage));
figure,imshow(nimage);
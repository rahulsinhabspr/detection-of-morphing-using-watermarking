clc;
clear all;

inputimage=imread('rahul','jpeg');
inputimage=rgb2gray(inputimage);


F=fftshift(fft2(inputimage));
r=abs(F);
theta=angle(F);


invf=r.*exp(j*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);

figure,imshow(imgae);
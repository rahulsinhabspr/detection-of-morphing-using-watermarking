clc;
clear all;
close all;


inputimage=imread('rahul','jpeg');
inputimage=rgb2gray(inputimage);
F=fftshift(fft2(inputimage));
r=abs(F);
theta=angle(F);
dr=diag(r);
[s1d,s2d] = size(dr);
sd=max(s1d,s2d);
[s1,s2]=size(inputimage);
p=seaching_for_p(s1);
q=seaching_for_q(s2);
[n,tot]=Calculation_for_n(p,q);
e=Calculation_for_e(tot);
d=Calculation_for_d(tot,e);
z=encrypting_the_message(e,sd,dr,n);
re=embedding_encrypted_data(sd,r,z);
% invf=re.*exp(1i*theta);
% imgn=ifftshift(invf);
% imgan=ifft2(imgn);
% imgaen=uint8(imgan);
% imwrite(imgaen,'encrypt_image.jpeg');
% figure,imshow(imgaen);


drn=diag(re);

ori=de(d,sd,drn,n);
sub=ori-dr';
dect=embedding_original_magnitude(sd,r,ori);
sub1=dect-re;
sub2=dect-r;
invf=dect.*exp(1i*theta);
imgn=ifftshift(invf);
imgan=ifft2(imgn);
imgaen=uint8(imgan);
figure,imshow(imgaen)










% 
% newimage=imread('encrypt_image','jpeg');
% Fnew=fftshift(fft2(newimage));
% rnew=abs(Fnew);
% theta1=angle(Fnew);
% sub1=theta1-theta
% 
% invfn=r.*exp(1i*theta1);
% imgn=ifftshift(invfn);
% imgan=ifft2(imgn);
% imgaen=uint8(imgan);
% % imwrite(imgaen,'encrypt_image.jpeg');
% figure,imshow(imgaen);


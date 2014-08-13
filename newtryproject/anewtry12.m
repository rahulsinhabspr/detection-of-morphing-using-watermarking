
clc;
clear all;
close all;

%given
n =1775957;
d =1418573;
encryptedimage=imread('encryptedimage','jpeg');
encryptedimage=rgb2gray(encryptedimage);
[s1,s2]=size(encryptedimage);

Fd=fftshift(fft2(encryptedimage));

rnew=abs(Fd);
thetanew=angle(Fd);


%encrypting the message.

for i1new=1:1:5
    z1new(i1new) = encryption(rnew((i1new),(i1new)),n,d);
end

for i2new=1:1:5
    z2new(i2new)=encryption(rnew(i2new,floor(s2/2)),n,d);
end

for i3=0:1:4
   z3new(i3+1)=encryption(rnew((i3+1),(s2-i3)),n,d); 
end

for i4new=0:1:4
   z4new(i4new+1)= encryption(rnew((s1-i4new),(i4new+1)),n,d);
end

for i5new=0:1:4
   z5new(i5new+1)= encryption(rnew((s1-i5new),(floor(s2/2)-i5new)),n,d);
end

for i6new=0:1:4
   z6new(i6new+1)= encryption(rnew((s1-i6new),(s2-i6new)),n,d);
end

for i7new=0:1:4
   z7new(i7new+1)= encryption(rnew((s1/2),(i7new+1)),n,d);
end

for i8new=0:1:4
   z8new(i8new+1)= encryption(rnew((s1/2),(s2/2-i8new)),n,d);
end

%embedding encrypted data in magnitude plot.

for j1new=1:1:5
    rnew(j1new,j1new)=z1new(j1new)/10;
end

for j2new=1:1:5
    rnew(j2new,floor(s2/2))=z2new(j2new)/10;
end

for j3new=0:1:4
   rnew((j3new+1),(s2-j3new))= z3new(j3new+1)/10; 
end

for j4new=0:1:4
   rnew((s1-j4new),(j4new+1))=z4new(j4new+1)/10;
end

for j5new=0:1:4
   rnew((s1-j5new),(floor(s2/2)-j5new))=z5new(j5new+1)/10;
end

for j6new=0:1:4
   rnew((s1-j6new),(s2-j6new))=z6new(j6new+1)/10;
end

for j7new=0:1:4
   rnew((s1/2),(j7new+1))=z7new(j7new+1)/10;
end

for j8new=0:1:4
   rnew((s1/2),(s2/2-j8new))=z8new(j8new+1)/10;
end




%Inverse Fourier Transform
invfnew=rnew.*exp(1i*thetanew);
imgnew=ifftshift(invfnew);
imganew=ifft2(imgnew);
imgaenew=uint8(imganew);
%Producing Output
figure,imshow(encryptedimage);
% title('Input Image');
figure,imshow(imgaenew);
title('Decryption using private key');












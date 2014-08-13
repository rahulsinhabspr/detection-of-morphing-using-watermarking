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
or=r;
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
%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
dr=diag(r);

%encrypting the message.

for i1=1:1:5
    z1(i1) = encryption(dr(i1),n,e);
end

for i2=1:1:5
    z2(i2)=encryption(r(i2,floor(s2/2)),n,e);
end

for i3=0:1:4
   z3(i3+1)=encryption(r((i3+1),(s2-i3)),n,e); 
end

for i4=0:1:4
   z4(i4+1)= encryption(r((s1-i4),(i4+1)),n,e);
end

for i5=0:1:4
   z5(i5+1)= encryption(r((s1-i5),(floor(s2/2)-i5)),n,e);
end

for i6=0:1:4
   z6(i6+1)= encryption(r((s1-i6),(s2-i6)),n,e);
end

for i7=0:1:4
   z7(i7+1)= encryption(r((s1/2),(i7+1)),n,e);
end

for i8=0:1:4
   z8(i8+1)= encryption(r((s1/2),(s2/2-i8)),n,e);
end

%embedding encrypted data in magnitude plot.

for j1=1:1:5
    r(j1,j1)=z1(j1);
end

for j2=1:1:5
    r(j2,floor(s2/2))=z2(j2);
end

for j3=0:1:4
   r((j3+1),(s2-j3))= z3(j3+1); 
end

for j4=0:1:4
   r((s1-j4),(j4+1))=z4(j4+1);
end

for j5=0:1:4
   r((s1-j5),(floor(s2/2)-j5))=z5(j5+1);
end

for j6=0:1:4
   r((s1-j6),(s2-j6))=z6(j6+1);
end

for j7=0:1:4
   r((s1/2),(j7+1))=z7(j7+1);
end

for j8=0:1:4
   r((s1/2),(s2/2-j8))=z8(j8+1);
end


% 
% %Inverse Fourier Transform
invf=r.*exp(1i*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);
% imwrite(imgae,'encryptedimage2.jpeg');
% Producing Output
figure,imshow(inputimage);
title('Input Image');
figure,imshow(imgae);
title('watermarking block wise throughout the image using rsa one tenth ');
% 
% %Decryption
% Fd=fftshift(fft2(imgae));
% rnew=abs(Fd);
% thetanew=angle(Fd);
% 
% %Calculate the principal diagonal element of magnitude of input image(FFT of input image).
% drnew=diag(rnew);
% 
% %encrypting the message.
% 
% for i1new=1:1:5
%     z1new(i1new) = encryption(drnew(i1new),n,d);
% end
% 
% for i2new=1:1:5
%     z2new(i2new)=encryption(rnew(i2new,floor(s2/2)),n,d);
% end
% 
% for i3=0:1:4
%    z3new(i3+1)=encryption(rnew((i3+1),(s2-i3)),n,d); 
% end
% 
% for i4new=0:1:4
%    z4new(i4new+1)= encryption(rnew((s1-i4new),(i4new+1)),n,d);
% end
% 
% for i5new=0:1:4
%    z5new(i5new+1)= encryption(rnew((s1-i5new),(floor(s2/2)-i5new)),n,d);
% end
% 
% for i6new=0:1:4
%    z6new(i6new+1)= encryption(rnew((s1-i6new),(s2-i6new)),n,d);
% end
% 
% for i7new=0:1:4
%    z7new(i7new+1)= encryption(rnew((s1/2),(i7new+1)),n,d);
% end
% 
% for i8new=0:1:4
%    z8new(i8new+1)= encryption(rnew((s1/2),(s2/2-i8new)),n,d);
% end
% 
% %embedding encrypted data in magnitude plot.
% 
% for j1new=1:1:5
%     rnew(j1new,j1new)=z1new(j1new);
% end
% 
% for j2new=1:1:5
%     rnew(j2new,floor(s2/2))=z2new(j2new);
% end
% 
% for j3new=0:1:4
%    rnew((j3new+1),(s2-j3new))= z3new(j3new+1); 
% end
% 
% for j4new=0:1:4
%    rnew((s1-j4new),(j4new+1))=z4new(j4new+1);
% end
% 
% for j5new=0:1:4
%    rnew((s1-j5new),(floor(s2/2)-j5new))=z5new(j5new+1);
% end
% 
% for j6new=0:1:4
%    rnew((s1-j6new),(s2-j6new))=z6new(j6new+1);
% end
% 
% for j7new=0:1:4
%    rnew((s1/2),(j7new+1))=z7new(j7new+1);
% end
% 
% for j8new=0:1:4
%    rnew((s1/2),(s2/2-j8new))=z8new(j8new+1);
% end
% 
% 
% 
% 
% %Inverse Fourier Transform
% invfnew=rnew.*exp(1i*thetanew);
% imgnew=ifftshift(invfnew);
% imganew=ifft2(imgnew);
% imgaenew=uint8(imganew);
% %Producing Output
% % figure,imshow(inputimage);
% % title('Input Image');
% figure,imshow(imgaenew);
% title('Decryption using private key');
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 





inputimage=imread('rahul','jpeg');
figure,imshow(inputimage);
title('Input Image');
gimage=rgb2gray(inputimage);
figure,imshow(gimage);
title('input Image converted to gray scale');
F=fftshift(fft2(gimage));
r=abs(F);
theta=angle(F);
invf=r.*exp(j*theta);
img=ifftshift(invf);
imga=ifft2(img);
imgae=uint8(imga);
figure,imshow(imgae);
title('input Image after processing fft and ifft ');
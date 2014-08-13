clc
clear all
close all
imageA = imread('lena','bmp');
fftA = fft2(double(imageA));
%m=fftshift(fftA)
% m=fftA;
% n=abs(m)
% [r c] = size(m);
% for i = 1:r
%     for j = 1:c
%     X(i,j) = m(i,j) + 0.001;
%     end
% end
[phase_fig,mag_fig]=cart2pol(real(fftA),imag(fftA));
% mag_fig=mag_fig+3.001;
[a,b]=pol2cart(phase_fig,mag_fig)
fftC=complex(a,b);
imageC = ifft2(fftC);

cmin = min(min(abs(imageC)))
cmax = max(max(abs(imageC)))
imaged=imageC-cmin;
imagee=imaged/max(max(imaged))*256;
figure
imshow(imageC)
% figure
% imshow(abs(fftC))
% figure, imshow(((imageC)), [cmin cmax]), colormap gray
title('Image C  Magnitude')


figure, imshow(imageA)
title('Image A - lena(origianl picture)')
% figure, imshow(n,[24 100000]), colormap gray
% title('Image A FFT2 original Magnitude')
% figure, imshow(X,[24 100000]), colormap gray
% title('Image A FFT2 modified Magnitude')
% figure, imshow(angle(fftshift(fftA)),[-pi pi]), colormap gray
% title('Image A FFT2 Phase')



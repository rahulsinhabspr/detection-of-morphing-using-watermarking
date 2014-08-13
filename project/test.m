I = imread('lena512.bmp');
%I = im2double(I);
F = fft2(I);
M = abs(F);
P = angle(F);
[r c] = size(M);
for i = 1:r
    for j = 1:c
    X(i,j) = M(i,j) + 0.01;
    end
end
RF = abs(F).*exp(i*angle(F));
R = ifft2(RF);
cmin = min(min(X));
cmax = max(max(X));
% figure, imshow(fftshift(M),[24 100000]), colormap gray

% figure, imshow(angle(fftshift(F)),[-pi pi]), colormap gray

% figure, imshow(fftshift(X),[24 100000]), colormap gray

figure, imshow(R), colormap gray

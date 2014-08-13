
clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 12;

%Take original image as input in matlab which convert can image into matrix.
inputimage=imread('rahul','jpg');
inputimage=rgb2gray(inputimage);

%Calculate the size of input image matrix.
[s1,s2]=size(inputimage);
%Take embedding image as input in matlab which can convert image into
%matrix.
embeddingimage=imread('photo','jpg');
embeddingimage=rgb2gray(embeddingimage);
%Calculate the size of embedding image matrix.
[s3,s4]=size(embeddingimage);
%Find the minimum value of the size of input image matrix and embedding
%image matrix.
s=[s1,s2,s3,s4];
minimum1=min(s);
%Resize the input image matrix and embedding image matrix according to the
%minimum value we find in the last step which will make both the matrix
%into square matrix of equal size.
inputimage=imresize(inputimage,[minimum1 minimum1]);
embeddingimage=imresize(embeddingimage,[minimum1 minimum1]);

originalimage=inputimage;
%Take Fast Fourier Transform of both image i.e input image and embedding
%image.
%7.	Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
fftofinputimage=fft2(inputimage);
%Take Fast Fourier Transform of input image and denote it with F i.e.F=Fm*ejFp.
fftofembeddingimage=fft2(embeddingimage);

%Calculate the magnitude of both the image i.e input image and embedding
%image.
%Calculate the magnitude of FFT of input image i.e Fm
amplitudeofinputimage=abs(fftofinputimage);
%Calculate the magnitude of FFT of input image i.e. EM.
amplitudeofembeddingimage=abs(fftofembeddingimage);


% size1=size(amplitudeofinputimage);
% size2=size(amplitudeofembeddingimage);

%Calculate the principal diagonal element of magnitude of input image(FFT of input image).
diagonalofamplitudeofinputimage=diag(amplitudeofinputimage);
%Calculate the principal diagonal element of magnitude of embedding
%image(FFT of embedding image).
diagonalofamplitudeofembeddingimage=diag(amplitudeofembeddingimage);

%Replace the principle diagonal element of magnitude of input image with
%the product of principal diagonal element of magnitude of input image and
%half of the prncipal diagonal element of magnitude of embedding image.
diagonalofamplitudeofinputimage=diagonalofamplitudeofinputimage .* (diagonalofamplitudeofembeddingimage/2);

%Repeat the above step to completely replace the principal diagonal
%element.
for i=1:minimum1
    amplitudeofinputimage(i,i)=diagonalofamplitudeofinputimage(i);
end



ffti=amplitudeofinputimage.*exp(i*angle(fftofinputimage));
%Take inverse fourier transform with modified magnitude and original phase
%to get watermarked image.
newimage=ifft2(ffti);
%Plot the watermarked image and original image.
figure,imshow(newimage);
title('Watermarked Image');
figure,imshow(originalimage);
title('Original Image');


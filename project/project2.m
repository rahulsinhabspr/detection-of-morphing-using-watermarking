
clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 12;


inputimage=imread('rahul','jpg');
inputimage=rgb2gray(inputimage);


[s1,s2]=size(inputimage);

embeddingimage=imread('photo','jpg');
embeddingimage=rgb2gray(embeddingimage);

[s3,s4]=size(embeddingimage);

s=[s1,s2,s3,s4];
minimum1=min(s);

inputimage=imresize(inputimage,[minimum1 minimum1]);
embeddingimage=imresize(embeddingimage,[minimum1 minimum1]);

originalimage=inputimage;

fftofinputimage=fft2(inputimage);
fftofembeddingimage=fft2(embeddingimage);


amplitudeofinputimage=abs(fftofinputimage);
amplitudeofembeddingimage=abs(fftofembeddingimage);


size1=size(amplitudeofinputimage);
size2=size(amplitudeofembeddingimage);

diagonalofamplitudeofinputimage=diag(amplitudeofinputimage);
diagonalofamplitudeofembeddingimage=diag(amplitudeofembeddingimage);
diagonalofamplitudeofinputimage=diagonalofamplitudeofinputimage .* (diagonalofamplitudeofembeddingimage/2);

for i=1:minimum1
    amplitudeofinputimage(i,i)=diagonalofamplitudeofinputimage(i);
end



ffti=amplitudeofinputimage.*exp(i*angle(fftofinputimage));
newimage=ifft2(ffti);
figure,imshow(inputimage);
title('Watermarked Image');
figure,imshow(originalimage);
title('Original Image');



clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 12;

morphedimage=imread('morphedimage','jpg');
morphedimage=rgb2gray(morphedimage);

[s1,s2]=size(morphedimage);


referenceimage=imread('photo','jpg');
referenceimage=rgb2gray(referenceimage);

[s3,s4]=size(referenceimage);

s=[s1,s2,s3,s4];
minimum1=min(s);

morphedimage=imresize(morphedimage,[minimum1 minimum1]);
referenceimage=imresize(referenceimage,[minimum1 minimum1]);

fftofmorphedimage=fft2(morphedimage);
fftofreferenceimage=fft2(referenceimage);


amplitudeofmorphedimage=abs(fftofmorphedimage);
amplitudeofreferenceimage=abs(fftofreferenceimage);



diagonalofamplitudeofmorphedimage=diag(amplitudeofmorphedimage);
diagonalofamplitudeofreferenceimage=diag(amplitudeofreferenceimage);
halfofdiagonalofamplitudeofrefernceimage=diagonalofamplitudeofreferenceimage;
diagonalofamplitudeofmorphedimage=diagonalofamplitudeofmorphedimage ./ halfofdiagonalofamplitudeofrefernceimage;

originalimage=imread('rahul','jpg');
originalimage=rgb2gray(originalimage);
originalimage=imresize(originalimage,[minimum1 minimum1]);

fftoforiginalimage=fft2(originalimage);
amplitudeoforiginalimage=abs(fftoforiginalimage);
diagonalofamplitudeoforiginalimage=diag(amplitudeoforiginalimage);

figure,imshow(morphedimage);
title('Morphed Image');

figure,imshow(referenceimage);
title('Reference Image');

figure,imshow(originalimage);
title('Original Image');


henceprovedmorphingisdoneornot=isequal(diagonalofamplitudeoforiginalimage,diagonalofamplitudeofmorphedimage)








clc;
close all;
clear all;

%read the movie
mov=VideoReader('Balam.avi');
%calculate the number of frames
numframes = get(mov, 'numberOfFrames');
%getting frames and converting into image
im=zeros(1,numframes,3);
for i=1:1:numframes
    Im=read(mov,i);
    Im=rgb2gray(Im);
    figure(1),imshow(Im,[]);
end

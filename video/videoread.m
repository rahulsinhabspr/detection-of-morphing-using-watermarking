clc;
close all;
clear all;

video1=VideoReader('Balam.avi');
 numFrames = get(video1, 'NumberOfFrames');
 vidframes = read(video1);
 nFrames=video1.NumberOfFrames;
 vidHeight=video1.Height;
 vidWidth=video1.Width;
 mov(1:nFrames) = struct('cdata',zeros(vidHeight,vidWidth, 3,'uint8'),'colormap',[]);
 for k = 1 : nFrames
    mov(k).cdata = read(video1,k);
 end
hf = figure;
set(hf, 'position', [150 150 vidWidth vidHeight])
movie(hf, mov, 1, video1.FrameRate);
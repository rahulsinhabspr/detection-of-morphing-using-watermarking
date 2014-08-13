clc;
close all;
clear all;

%making video from images
% the folder in which ur images exists
inputfolder=strcat('C:\Users\rahul.asus.000\Documents\MATLAB\video\dout4m2\*.png');
srcFiles = dir(inputfolder);
%Creating output video
vidobj = VideoWriter('newmorphedbalam22','Uncompressed AVI');
open(vidobj);
for i=1:length(srcFiles)
    filename = strcat('C:\Users\rahul.asus.000\Documents\MATLAB\video\dout4m2','\',srcFiles(i).name);
    I = imread(filename);
    writeVideo(vidobj,I);
    end

close(vidobj);
clc;
clear all;
close all;

% assigning the name of sample avi file to a variable
videoname='encrytedbalam.avi';
%reading a video file
mov=VideoReader(videoname);
%getting no of frames
numberofframes=mov.NumberOfFrames;
%getting framerate
framerate=mov.FrameRate;
frmae=read(mov,50);

clc;
close all;
clear all;

%assinging the name of input file to a variable
originalvideo='Balam.avi';
%reading a video file
inputmov=VideoReader(originalvideo);
%definging output folder as 'out1'
outputfolder1=fullfile(cd,'out1');
%if not existing
if ~exist(outputfolder1,'dir')
    %make directory
    mkdir(outputfolder1);
end
%getting number of frames
numberofframes1=inputmov.NumberOfFrames;
%setting current status of number of frames written to zero
numframesWritten1=0;
for t1=1:30
   currentinputframe=read(inputmov,(t1+100));
   outputbasefilename1=sprintf('%3.3d.png',t1);
    outputfullfilename1=fullfile(outputfolder1,outputbasefilename1);
    %saving as 'png' file
    imwrite(currentinputframe,outputfullfilename1,'png');
    %indicating the current progress of the file/frame written
    progressindication=sprintf('Wrote frame %4d of %d.',(t1+30),numberofframes1);
    disp(progressindication);
    numframesWritten1=numframesWritten1+1;
end
progressindication=sprintf('Wrote %d frames to folder "%s"',numframesWritten1,outputfolder1);
disp(progressindication);

%making video from images
% the folder in which ur images exists
inputfolder=strcat(outputfolder1,'\*.png');
srcFiles = dir(inputfolder);
%storingenc values
storingenc=zeros(1,(length(srcFiles)));
%Creating output video
vidobj = VideoWriter('newencrytedbalam1','Uncompressed AVI');
open(vidobj);
for i = 1 : length(srcFiles)
    filename = strcat(outputfolder1,'\',srcFiles(i).name);
    I = imread(filename);
    if i==1
       I1=I;
    elseif i==2
        I2=I;
    elseif i==3
        I3=I;
    elseif i==4
        I4=I;
    elseif i==5
        I5=I;
    else
        I6=I;
    end
    figure (1), imshow(I,[]);
    writeVideo(vidobj,I);
end

close(vidobj);

mov=VideoReader('newencrytedbalam1.avi');

numberofframes2=mov.NumberOfFrames;
frame1=read(mov,1);
ans1=isequal(frame1,I1);
frame2=read(mov,2);
ans2=isequal(frame2,I2);
frame3=read(mov,3);
ans3=isequal(frame3,I3);

frame4=read(mov,4);
ans4=isequal(frame4,I4);

frame5=read(mov,5);
ans5=isequal(frame5,I5);

frame6=read(mov,numberofframes2);
ans6=isequal(frame6,I6);
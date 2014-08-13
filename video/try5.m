clc;
close all;
clear all;

%assinging the name of input file to a variable
originalvideo='Balam.avi';
%reading a video file
inputmov1=VideoReader(originalvideo);
%defining output folder as out2
outputfolder1=fullfile(cd,'out2');
%if output folder doesnot exit
if ~exist(outputfolder1,'dir');
    %make directory
    mkdir(outputfolder1);
end
%getting number of frames
numberofframes1=inputmov1.NumberOfFrames;
%setting current status of number of frames written to zero
numframeswritten1=0;
%Creating output video
vidobj = VideoWriter('newgrayscaleencrytedbalam1','Uncompressed AVI');
open(vidobj);
%for loop to convert and store gray scale image
for t1=1:numberofframes1
   currentinputframe1=read(inputmov1,(t1));
   currentinputframe2=rgb2gray(currentinputframe1);
   %writing frame to video file
   writeVideo(vidobj,currentinputframe2);
   %Creating filename
   outputbasefilename1=sprintf('%3.3d.png',t1);
   outputfullfilename1=fullfile(outputfolder1,outputbasefilename1);
   %saving as 'png' file
   imwrite(currentinputframe2,outputfullfilename1,'png');
    %indicating the current progress of the file/frame written
    progressindication=sprintf('Wrote frame %4d of %d.',(t1),numberofframes1);
    disp(progressindication);
    numframeswritten1=numframeswritten1+1;
    %show sequence of images
    figure (1),imshow(currentinputframe2,[]);
end
close(vidobj);

progressindication=sprintf('Wrote %d frames to folder "%s"',numframeswritten1,outputfolder1);
disp(progressindication);

%%Extracting & Saving of frames from a Video file through Matlab Code%%
clc;
close all;
clear all;

% assigning the name of sample avi file to a variable
videoname='Balam.avi';
%reading a video file
mov=VideoReader(videoname);

% Defining Output folder as 'snaps'
outputfolder=fullfile(cd,'snaps');
%if not existing
if ~exist(outputfolder,'dir')
    %make directory & execute as indicated in opfolder variable
    mkdir(outputfolder);
end
%getting no of frames
numframes=mov.NumberOfFrames;
%setting current status of number of frames written to zero
numframesWritten=0;
%for loop to traverse & process from frame '1' to 'last' frames
for t=1:numframes
    currentframe=read(mov,t);
    outputbasefilename=sprintf('%3.3d.png',t);
    outputfullfilename=fullfile(outputfolder,outputbasefilename);
    imwrite(currentframe,outputfullfilename,'png');%saving as 'png' file
    %indicating the current progress of the file/frame written
    progressindication=sprintf('Wrote frame %4d of %d.',t,numframes);
    disp(progressindication);
    numframesWritten=numframesWritten+1;
end
%end of 'for' loop

progressindication=sprintf('Wrote %d frames to folder "%s"',numframesWritten,outputfolder);
disp(progressindication);
%End of the code
    
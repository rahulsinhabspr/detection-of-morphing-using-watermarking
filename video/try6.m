clc;
close all;
clear all;

%assinging the name of input file to a variable
originalvideo='Balam.avi';
%reading a video file
inputmov1=VideoReader(originalvideo);
%defining output folder as out2
outputfolder1=fullfile(cd,'dout4');
%if output folder doesnot exit
if ~exist(outputfolder1,'dir');
    %make directory
    mkdir(outputfolder1);
end
%getting number of frames
numberofframes1=inputmov1.NumberOfFrames;
%setting current status of number of frames written to zero
numframeswritten1=0;
%storing enc value
storingenc=zeros(1,numberofframes1);
%Creating output video
vidobj = VideoWriter('againewgrayscalemyencrytedbalam1','Uncompressed AVI');
open(vidobj);
%for loop to convert and store gray scale image
for t1=1:numberofframes1
   currentinputframe1=read(inputmov1,(t1));
   currentinputframe2=rgb2gray(currentinputframe1);
   input1=currentinputframe2;
   %calculating size of frame
   [s1,s2]=size(input1);
   n=s1*s2;
    %pixel location where modification will be done
    n1=round(s1/2);
    n2=round(s2/2);
    n3=round(s1/4);
    n4=round(s2/4);
    n5=round(0.75*s1);
    n6=round(0.75*s2);
    %Calculating modulus of every pixel with 10
    for j=1:s1
        for k=1:s2
           z(j,k)=mod(input1(j,k),10); 
        end
    end
    %Calculating the sum
    znew1=sum(z);
    znew2=sum(znew1);
    %encryption value
    enc=mod(znew2,10);
    storingenc(t1)=enc;
    %Encrypt the 1
    b1=mod(input1(1,1),enc);
    input1(1,1)=input1(1,1)-b1;
    %Encrypt pixel 2
    b2=mod(input1(1,n4),enc);
    input1(1,n4)=input1(1,n4)-b2;
    %Encrypt pixel 3
    b3=mod(input1(1,n2),enc);
    input1(1,n2)=input1(1,n2)-b3;
    %Encrypt pixel 4
    b4=mod(input1(1,n6),enc);
    input1(1,n6)=input1(1,n6)-b4;
    %Encrypt pixel 5
    b5=mod(input1(1,s2),enc);
    input1(1,s2)=input1(1,s2)-b5;
    %Encrypt the 6
    b6=mod(input1(n3,1),enc);
    input1(n3,1)=input1(n3,1)-b6;
    %Encrypt pixel 7
    b7=mod(input1(n3,n4),enc);
    input1(n3,n4)=input1(n3,n4)-b7;
    %Encrypt pixel 8
    b8=mod(input1(n3,n2),enc);
    input1(n3,n2)=input1(n3,n2)-b8;
    %Encrypt pixel 9
    b9=mod(input1(n3,n6),enc);
    input1(n3,n6)=input1(n3,n6)-b9;
    %Encrypt pixel 10
    b10=mod(input1(n3,s2),enc);
    input1(n3,s2)=input1(n3,s2)-b10;
    %Encrypt the 11
    b11=mod(input1(n1,1),enc);
    input1(n1,1)=input1(n1,1)-b11;
    %Encrypt pixel 12
    b12=mod(input1(n1,n4),enc);
    input1(n1,n4)=input1(n1,n4)-b12;
    %Encrypt pixel 13
    b13=mod(input1(n1,n2),enc);
    input1(n1,n2)=input1(n1,n2)-b13;
    %Encrypt pixel 14
    b14=mod(input1(n1,n6),enc);
    input1(n1,n6)=input1(n1,n6)-b14;
    %Encrypt pixel 15
    b15=mod(input1(n1,s2),enc);
    input1(n1,s2)=input1(n1,s2)-b15;
    %Encrypt the 16
    b16=mod(input1(n5,1),enc);
    input1(n5,1)=input1(n5,1)-b16;
    %Encrypt pixel 17
    b17=mod(input1(n5,n4),enc);
    input1(n5,n4)=input1(n5,n4)-b17;
    %Encrypt pixel 18
    b18=mod(input1(n5,n2),enc);
    input1(n5,n2)=input1(n5,n2)-b18;
    %Encrypt pixel 19
    b19=mod(input1(n5,n6),enc);
    input1(n5,n6)=input1(n5,n6)-b19;
    %Encrypt pixel 20
    b20=mod(input1(n5,s2),enc);
    input1(n5,s2)=input1(n5,s2)-b20;
    %Encrypt the 21
    b21=mod(input1(s1,1),enc);
    input1(s1,1)=input1(s1,1)-b21;
    %Encrypt pixel 22
    b22=mod(input1(s1,n4),enc);
    input1(s1,n4)=input1(s1,n4)-b22;
    %Encrypt pixel 23
    b23=mod(input1(s1,n2),enc);
    input1(s1,n2)=input1(s1,n2)-b23;
    %Encrypt pixel 24
    b24=mod(input1(s1,n6),enc);
    input1(s1,n6)=input1(s1,n6)-b24;
    %Encrypt pixel 25
    b25=mod(input1(s1,s2),enc);
    input1(s1,s2)=input1(s1,s2)-b25;
    r=[b1 b2 b3 b4 b5;
    b6 b7 b8 b9 b10;
    b11 b12 b13 b14 b15;
    b16 b17 b18 b19 b20;
    b21 b22 b23 b24 b25];
    %new row
    newrow=zeros(1,(s2+1));
    for il=1:s2
       newrow(1,il)=input1(s1,il); 
    end
    for j=1:5
          newrow(1,(1+j))=r(1,j);
          newrow(1,(n4+j))=r(2,j);
          newrow(1,(n2+j))=r(3,j);
          newrow(1,(n6+j))=r(4,j);
          newrow(1,(s2-j))=r(5,j);
    end
    %new col
    newcol=zeros((s1+1),1);
    for u=1:1:s1
    newcol(u,1)=input1(u,s2);
    end
    for j=1:1:5
         newcol((1+j),1)=r(1,j);
         newcol((n3+j),1)=r(2,j);
         newcol((n1+j),1)=r(3,j);
         newcol((n5+j),1)=r(4,j);
         newcol((s1-j),1)=r(5,j);
    end
    %newimage  
    input1=[input1;zeros(1,s2)];
    input1=[input1,zeros((s1+1),1)];
    input1((s1+1),(s2+1))=255;
    for ij=1:s1
       input1(ij,(s2+1))=newcol(ij,1); 
    end
    for iji=1:s2
       input1((s1+1),iji)=newrow(1,iji); 
    end
    %saving location inside the frame
    input1((s1+1),1)=254;
    input1((s1+1),n2)=254;
    input1((s1+1),n4)=254;
    input1((s1+1),n6)=254;
    input1((s1+1),s2)=254;
    input1(1,(s2+1))=254;
    input1(n1,(s2+1))=254;
    input1(n3,(s2+1))=254;
    input1(n5,(s2+1))=254;
    input1(s1,(s2+1))=254;
    
   if enc==1
       input1((s1+1),(s2+1))=254;
   else
       input1((s1+1),(s2+1))=255;
   end
   currentinputframe3=input1;   
   
   %writing frame to video file
   writeVideo(vidobj,currentinputframe3);
   %Creating filename
   outputbasefilename1=sprintf('%3.3d.png',t1);
   outputfullfilename1=fullfile(outputfolder1,outputbasefilename1);
   %saving as 'png' file
   imwrite(currentinputframe3,outputfullfilename1,'png');
    %indicating the current progress of the file/frame written
    progressindication=sprintf('Wrote frame %4d of %d.',(t1),numberofframes1);
    disp(progressindication);
    numframeswritten1=numframeswritten1+1;
    %show sequence of images
    figure (1),imshow(currentinputframe3,[]);
end
close(vidobj);

progressindication=sprintf('Wrote %d frames to folder "%s"',numframeswritten1,outputfolder1);
disp(progressindication);

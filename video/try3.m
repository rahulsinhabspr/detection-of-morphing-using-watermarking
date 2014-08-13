clc;
clear all;
close all;

% assigning the name of sample avi file to a variable
videoname='Balam.avi';
%reading a video file
mov=VideoReader(videoname);
%getting no of frames
numberofframes=mov.NumberOfFrames;
%getting framerate
framerate=mov.FrameRate;
%video height
vidheight=mov.Height;
%video width
vidwidth=mov.Width;
%creating new movie file
mymov(1:30) = struct('cdata',zeros(vidheight,vidwidth, 3,'uint8'),'colormap',[]);
vidobj = VideoWriter('encrytedbalam1.avi');
open(vidobj);
%setting current status of number of frames written to zero
numframesWritten=0;
storingenc=zeros(1,30);
for i=1:30
    mymov(i).cdata = read(mov,(i+60));
    input1 = mymov(i).cdata ;
    [s1,s2,s3]=size(mymov(i).cdata);
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
    storingenc(i)=enc;
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
    input1=[input1;zeros(1,s2,s3)];
    input1=[input1,zeros((s1+1),1,s3)];
    input1((s1+1),(s2+1),s3)=255;
    for ij=1:s1
       input1(ij,(s2+1))=newcol(ij,1); 
    end
    for iji=1:s2
       input1((s1+1),iji)=newrow(1,iji); 
    end
    %saving location inside the frame
    input1((s1+1),1)=255;
    input1((s1+1),n2)=255;
    input1((s1+1),n4)=255;
    input1((s1+1),n6)=255;
    input1((s1+1),s2)=255;
    input1(1,(s2+1))=255;
    input1(n1,(s2+1))=255;
    input1(n3,(s2+1))=255;
    input1(n5,(s2+1))=255;
    input1(s1,(s2+1))=255;
    
    mymov(i).cdata=input1;
%     disp(size(mymov(i).cdata));
    
    
    writeVideo(vidobj,mymov(i).cdata);
% %     figure (1),imshow(mymov(i).cdata,[]);
%     %indicating the current progress of the file/frame written
%     progressindication=sprintf('Wrote frame %4d of %d.',i,numberofframes);
%     disp(progressindication);
%     numframesWritten=numframesWritten+1;
     
end
% progressindication=sprintf('Wrote %d frames to new video',numframesWritten);
% disp(progressindication);
close(vidobj);
firstframe1=mymov(1).cdata;
figure,imshow(firstframe1,[]);
% movie2avi(mymov,'myencryptedmovie.avi');

% hf=figure;
% set(hf,'position',[150 150 vidwidth vidheight]);
% movie(hf,mymov,1,framerate);


% assigning the name of sample avi file to a variable
videoname1='encrytedbalam1.avi';
%reading a video file
nmov=VideoReader(videoname1);

firstframe=read(nmov,1);

figure,imshow(firstframe,[]);



ans=isequal(firstframe,firstframe1)















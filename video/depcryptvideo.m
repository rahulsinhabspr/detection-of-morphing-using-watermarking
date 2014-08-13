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
%video height
vidheight=mov.Height;
%video width
vidwidth=mov.Width;
%setting current status of number of frames written to zero
numofframesread=0;
for i=1:30
    currentframe=read(mov,(i+30));
    %indicating the current progress of the file/frame written
    progressindication=sprintf('read frame %4d of %d.',i,numberofframes);
    disp(progressindication);
    %getting size of each frame of given input
    [s11,s22,s33]=size(currentframe);
    %decreasing one row and column
    s111=s11-1;
    s222=s22-1;
    s333=s33; 
    %creating new image with one row and column less
    newcurrentframe=zeros(s111,s222,s333);
    newcurrentframe=currentframe(1:s111,1:s222,1:s333);
    %accessing last row
    for j=1:1:s222
        row(1,j)=currentframe(s11,j); 
    end
    %finding 255 pixel value in the last row
    zr=zeros(1,s22);
    for j=1:1:s222
       if (row(1,j)==255)
           zr(j)=j;
       end
    end
    p=find(zr);
    %checking size of p if p=5 program continue otherwise terminate
    if (max(size(p))==5)
          % accessing last column
           for k=1:s111
                col(k,1)=currentframe(k,s22); 
           end
            %finding 255 pixel value in the last col
             zc=zeros(1,s111);
             for k=1:s111
                if (col(k,1)==255)
                    zc(k)=k;
                end
             end
              q=find(zc);
              if (max(size(q))==5)
                %desidered pixel location
                for j1=1:5
                    for j2=1:5
                        dp(j1,j2)= newcurrentframe(q(j1),p(j2));
                    end
                end
                % finding number from 2 to 10 which are divisible to desidered
                % pixel
                l=0;
                div=zeros(5,5);
                for j3=1:max(size(dp))
                    for j4=1:max(size(dp))
                    l=l+1;
                        for k=1:9
                            t=mod(dp(j3,j4),(k+1));
                                if t==0
                                    div(l,k)=k+1; 
                                end
                        end
                    end
                end
                
                % finding maximum no. of times 2 to 10 occurs or obtained encrypted
                % value
                [m1,n1]=size(div);
                p3=[2 3 4 5 6 7 8 9 10];
                nn=m1*n1;
                c2=0;c3=0;c4=0;c5=0;c6=0;c7=0;c8=0;c9=0;c10=0;
                for ij=1:1:nn
                    if p3(1)==div(ij)
                           c2=c2+1;
                    elseif p3(2)==div(ij)
                           c3=c3+1;
                    elseif p3(3)==div(ij)
                           c4=c4+1;
                    elseif p3(4)==div(ij)
                           c5=c5+1;
                    elseif p3(5)==div(ij)
                           c6=c6+1;
                    elseif p3(6)==div(ij)
                           c7=c7+1;
                    elseif p3(7)==div(ij)
                           c8=c8+1;
                    elseif p3(8)==div(ij)
                           c9=c9+1;
                    elseif p3(9)==div(ij)
                           c10=c10+1;
                    end
                end

                sd=[c2,c3,c4,c5,c6,c7,c8,c9,c10];
                qnew=max(sd);
                [pp,qq]=size(sd);
                sdn=zeros(pp,qq);
                
                 for j=1:1:(pp*qq)
                    if qnew ==sd(j)
                        sdn(j)=p3(j);
                    end
                 end
                 
                k3=1;
                for p=1:1:(pp*qq)
                    if sdn(p)~= 0
                       oe(k3)=sdn(p);
                       k3=k3+1;
                    end
                end
                 
                 %checking 10 is present in oe or not if it is their than
                 %replace it with 0
                 u=max(size(oe));
                 for t=1:u
                    if(oe(t)==10)
                        oe(t)=0;
                    end
                 end
                 
                 %finding remainder
                 maxp=max(size(p));
                 maxq=max(size(q));
                 pq=max(maxp,maxq);

                 for k=1:1:pq
                    a1(k)=row(1,p(1)+k); 
                    b1(k)=col(q(1)+k,1);

                    a2(k)=row(1,p(2)+k); 
                    b2(k)=col(q(2)+k,1);

                    a3(k)=row(1,p(3)+k); 
                    b3(k)=col(q(3)+k,1);

                    a4(k)=row(1,p(4)+k); 
                    b4(k)=col(q(4)+k,1);

                    a5(k)=row(1,p(5)-k); 
                    b5(k)=col(q(5)-k,1);    
                 end
                 %checking remainder are same or not,if not then terminate the
                 %program
                  if (a1==b1 & a2==b2 & a3==b3 & a4==b4 & a5==b5)
                        % adding remainder value to the pixel value so that origginal image is generated
                        for k=1:pq
                            newcurrentframe(q(1),p(k))=newcurrentframe(q(1),p(k))+a1(k);
                            newcurrentframe(q(2),p(k))=newcurrentframe(q(2),p(k))+a2(k);
                            newcurrentframe(q(3),p(k))=newcurrentframe(q(3),p(k))+a3(k);
                            newcurrentframe(q(4),p(k))=newcurrentframe(q(4),p(k))+a4(k);
                            newcurrentframe(q(5),p(k))=newcurrentframe(q(5),p(k))+a5(k);
                        end
                        %Calculating new ne from modified image
                        for j=1:s111
                            for k=1:s222
                                zdd(j,k)=mod(newcurrentframe(j,k),10); 
                            end
                        end
        
                        znewdd=sum(zdd);
                        znewddd=sum(znewdd);
                        ne=mod(znewddd,10);
                  
                        %checking last pixel is 255 or not if it is then oe=1;
                        if (newgiveninput(s111,s222)==255)
                            oe1=1; 
                        end
                        
                         %checking image is morphed or not
                         if (ne==1)
                            if(ne==oe1) 
                               disp('image is not morphed(1)'); 
                               r=1;
                            end
                         else
                             for b=1:u
                                if oe(b)==ne
                                   disp('image is not morphed');
                                   r=1;
                                else
                                    disp('iamge is morphed');
                                end
                             end
                         end

                         if r==1
                             disp('final given input image is not morphed');
                         else
                             disp('final given input image is morphed');
                         end
              
                  
                  else
                      disp('Image is modified3');
                  end
              else
                 disp('Image is modified2');
              end
    else
        disp('Image is modified1');
    end
        
    numofframesread=numofframesread+1;
    figure (1),imshow(newcurrentframe,[]);
end
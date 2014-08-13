
clc;
clear;
clear all;

M=90;
m=M:-1:70;
ml=length(m);
mfirst=m(1);
mlast=m(ml);

for j=0:(mfirst-mlast) 
      Prime=1;
      for i=2:((mfirst-j)/2)
          if mod((mfirst-j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1 
          p=m(j+1)
          break;
      else
     
      end
  end



N=90;
n=N:1:110;
nl=length(n);
nfirst=n(1);
nlast=n(nl);

for j=0:(nlast-nfirst) 
      Prime=1;
      for i=2:((nfirst+j)/2)
          if mod((nfirst+j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1
          q=n(j+1)
          break;
      else
     
      end
  end
  
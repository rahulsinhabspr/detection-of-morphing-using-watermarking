
function [p]=seaching_for_p(x)
M=x;
m=M:-1:(M-20);
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
          p=m(j+1);
          break;
      else
     
      end
  end
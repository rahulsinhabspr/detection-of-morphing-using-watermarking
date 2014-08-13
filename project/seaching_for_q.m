
function [q]=seaching_for_q(x)
N=x;
n11=N:1:(N+20);
nl=length(n11);
nfirst=n11(1);
nlast=n11(nl);

for j=0:(nlast-nfirst) 
      Prime=1;
      for i=2:((nfirst+j)/2)
          if mod((nfirst+j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1
          q=n11(j+1);
          break;
      else
     
      end
end
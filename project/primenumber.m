
M=92;

m=zeros(1,(M-1));

for i=2:1:M;
    m(i-1)=i;
end

m=fliplr(m);

for j=1:1:(M-1)
    if (mod(m(j),(j+1))==0)
    else
        p=m(j);
        s=sprintf('Required p for RSA %d',p);
        break
    end
end


N=90;
n=zeros(1,10);

for a=0:1:10
    n(a+1)=N + a;
end

for b=1:10
    if (mod(n(b),(b+1))==0)
    else
        q=n(b);
        break
    end
end







% for b=1:1:30
%    for c=1:1:30
%     if (mod(n(b),(c+1))==0)
%        continue     
%     else
%         q(b)=n(b)
%         s=sprintf('Required q for RSA %d',q);
%         break 
%     end
%    end
%    
% end

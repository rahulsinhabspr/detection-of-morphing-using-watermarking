
clear all;

given_number=7

for i=2:(given_number - 1)
    remainder = mod(given_number,i);
    if remainder == 0
        g(i)=3;
        break;
    else
        g(i)=4;
        break;
    end
    
end
[m,n] = size(g);



clc;
clear all;
close all;

a=[255,254,203,252,251]
b=[250;249;248;247;246]

c=[a,b'];
c=sort(c);
q=max(size(c));
q1=q+1;
kgp=255;
for i=1:max(size(c))
    if c(q1-i)~=kgp;
        break;
    else
        kgp=kgp-1;
    end
    
end

clc;
clear all;
p=17;

if (mod(p,2) == 0 );
else
    x=mod(p,2);
    y=p-x;
    quo1=y/2;
    quo2=quo1/2;
    quo3=quo2/2;
    y=[quo1 quo2 quo3]
    
end
a=mod(65,3233)
b=mod(65^2,3233)
c=mod(b^2,3233)
d=mod(c^2,3233)
e=mod(d^2,3233)
req=mod((a*e),3233)
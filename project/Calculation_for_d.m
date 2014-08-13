
function [d]=Calculation_for_d(tot,e)

ii=1;
r=1;
while r > 0
k=(tot*ii)+1;
r=mod(k,e);
ii=ii+1;
end
d=k/e;

function [e]=Calculation_for_e(x1)

x=2;e=1;

while x > 1

    e=e+1;

    x=gcd(x1,e);

end
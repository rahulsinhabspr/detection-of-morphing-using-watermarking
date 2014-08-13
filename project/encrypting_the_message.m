
function z=encrypting_the_message(e,sd,dr,n)

e

if ~isvector(dr)
    error('Input must be a vector')
end
for ij=1:1:sd
    y(ij)=dr(ij);
    x1=mod(y(ij),n);
    x2=mod((y(ij)^2),n);
    x3=mod((x2)^2,n);
    x4=mod((x1*x3),n);
    z(ij)=x4;

end
e=17
e=dec2bin(e);
k = 65535;
c =98;
cf = 1;
N=8633
cf=mod(c*cf,N);
for i=k-1:-1:1
c = mod(c*c,N);
j=k-i+1;
if e(j)==1
cf=mod(c*cf,N);
end
end
mc=cf;


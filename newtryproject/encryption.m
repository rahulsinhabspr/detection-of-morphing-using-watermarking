function encrypt = encryption(M,N,e)

e=d2b(e);

k = 65535;

c  = M;

cf = 1;

cf=mod(c*cf,N);

for i=k-1:-1:1

    c = mod(c*c,N);

    j=k-i+1;

     if e(j)==1

         cf=mod(c*cf,N);

     end

end

encrypt=cf;

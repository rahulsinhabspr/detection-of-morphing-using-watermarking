r = 65;
p = 17;

rem = mod(p,2);
if rem ==1
    t1 = r;
    t2 = r^(p/2);
    n = t1*t2;
end
p  = floor(p/2);
rem = mod(n,2);
if rem ==0
    t1 = r*r;
    t2 = r^(p/2);
end
p  = p/2;
rem = mod(n,2);
if rem ==0
    t1 = r*r*r;
    t2 = r^(p/2);
end
p=p/2;
rem = mod(n,2);
if rem ==0
    t1 = r*r*r*r;
    t2 = r^(p/2);
end
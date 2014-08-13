
c=5328;
d=15725;
n=19939;

c1=c;
m1=mod(c1,n);
c2=c1*c1;
m2=mod(c2,n);
c3=m2^2;
m3=mod(c3,n);
m4_1=mod(m3,n);
c4=m3^2;
m4_2=mod(c4,n);
c4_1=m1*m4_1;
m4_3=mod(c4_1,n);
c5=m4_2^2;
c5_1=m4_3*m4_2;
m5=mod(c5,n);
m5_1=mod(c5_1,n);
c6=m5^2;
m6=mod(c6,n);
c7_1=m6*m5_1;
m7_1=mod(c7_1,n);
c7=m6^2;
m7=mod(c7,n);
c8_1=m7*m7_1;
m8_1=mod(c8_1,n);
c8=m7^2;
m8=mod(c8,n);
c9=m8^2;
m9=mod(c9,n);
c10_1=c9*m8_1;
m10_1=mod(c10_1,n);
c10=c9^2;
m10=mod(c10,n);
c11=m10^2;
m11=mod(c11,n);
c12_1=m11*m10_1;
m12_1=mod(c12_1,n);
c12=m11^2;
m12=mod(c12,n);
c13_1=m12*m12_1;
m13_1=mod(c13_1,n);
c13=m12^2;
m13=mod(c13,n);
c14_1=m13_1*m13;
m14_1=mod(c14_1,n);
c14=m13^2;
m14=mod(c14,n);
c15=m14*m14_1;
m15=mod(c15,n);
mreq=m15;

% ori(i)=mreq;



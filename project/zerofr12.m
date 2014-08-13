% clear all
% x = [1:3];
% h = [4:6];
% xM = toeplitz([x zeros(1,length(h)-1) ], [x(1) zeros(1,length(h)-1) ]);
% y1 = xM*h';
% y2 = conv(x,h);
% diff = y1'-y2
ht = [0.2 0.9 0.3];
L = length(ht);
kk = 1;
hM = toeplitz([ht([2:end]) zeros(1,2*kk+1-L+1)], [ ht([2:-1:1]) zeros(1,2*kk+1-L+1) ])
d  = zeros(1,2*kk+1);
d(kk+1) = 1;
c  = [inv(hM)*d.'].';
SNRdB=100;
r=awgn(c,SNRdB);


Xh(find(Xh>0))=1;

Xh(find(Xh<0))=-1;

Xh

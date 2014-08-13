
Implementation of RSA Cryptography Algorithm Using MATLAB Code

d2b.m %function for conversion of decimal number to binary number
function a = d2b(d)

i=1;

a=zeros(1,65535);

while d >= 2

    r=rem(d,2);

    if r==1

        a(i)=1;

    else

        a(i)=0;

    end

    i=i+1;

    d=floor(d/2);

end

if d == 2

    a(i) = 0;

else

    a(i) = 1;

end
x=[a(16) a(15) a(14) a(13) a(12) a(11) a(10) a(9) a(8) a(7) a(6) a(5)]

init.m   %For Initialization
function [Pk,Phi,d,e] = init(p,q)

clc;

disp('Initializing:');

Pk=p*q;

Phi=(p-1)*(q-1);

%For Calculating the value of e

x=2;e=1;

while x > 1

    e=e+1;

    x=gcd(Phi,e);

end

%For Calculating the value of d

i=1;

r=1;

while r > 0

    k=(Phi*i)+1;

    r=rem(k,e);

    i=i+1;

end

d=k/e;

clc;

disp(['The value of (N) is: ' num2str(Pk)]);

disp(['The public key (e) is: ' num2str(e)]);

disp(['The value of (Phi) is: ' num2str(Phi)]);

disp(['The private key (d)is: ' num2str(d)]);

crypto.m     %For Cryptography Key Generation
function mc = crypto(M,N,e)

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

mc=cf;

rsa.m  %for RSA Algorithm
clc;

disp('Implementation of RSA Algorithm');

clear all; 
close all;

p = input('\nEnter value of p: ');

q = input('\nEnter value of q: ');

[Pk,Phi,d,e] = init(p,q);

M = input('\nEnter message: ','s');

x=length(M);

c=0;

for j= 1:x

    for i=0:122

        if strcmp(M(j),char(i))

            c(j)=i;

        end

    end

end

disp('ASCII Code of the entered Message:');

disp(c); 

% For Encryption

for j= 1:x

   cipher(j)= crypto(c(j),Pk,e); 

end

disp('Cipher Text of the entered Message:');

disp(cipher);

% For Decryption

for j= 1:x

   message(j)= crypto(cipher(j),Pk,d); 

end

disp('Decrypted ASCII of Message:');

disp(message);

disp(['Decrypted Message is: ' message]);
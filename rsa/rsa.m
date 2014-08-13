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

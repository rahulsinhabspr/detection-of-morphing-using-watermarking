

clc;
clear all;

x = [1 2 3;4 5 6;7 8 9];

for i=1:1:9
y(i) = x(i);
end
fid = fopen('aaaaexpre.txt','wt');
fprintf(fid,'%0.6f %0.6f\n',y);
fclose(fid);



clc;
clear all;

x = [1 2 3;4 5 6;7 8 9];
y = [x; exp(x)];
fid = fopen('expe.txt','w');
fprintf(fid,'%6.2f  %12.8f\n',y);
fclose(fid);

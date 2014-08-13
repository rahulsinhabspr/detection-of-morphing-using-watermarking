clc;
clear all;
close all;

% A=cell(1,4196);
for i=1:4196
    s=sprintf('%3.3d.png',i);
    a=imread(s);
    [m n o]=size(a);
    for j=1:m
        for k=1:n
        z(j,k)=mod(a(j,k),10)
        end
    end
%     figure (1) ,imshow(a,[]);
end

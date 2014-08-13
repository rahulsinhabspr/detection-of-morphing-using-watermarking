clc;
clear all;
close all;

% A=cell(1,4196);
for i=1:4196
    s=sprintf('%d.png',i);
    a=imread(s);
    figure (1) ,imshow(a,[]);
end

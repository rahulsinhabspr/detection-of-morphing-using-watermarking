% 
% clear all;
% m=10
% q=zeros(1,m)
% for i=1:1:m
%     q(i)=i;
%     if q(i)>1
%        if mod(m,q(i)) ~= 0
%            p=q(i);
%            
%        end
%        
%     end
%     
%     
% end

clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 12;

m=10;
p=zeros(1,(m-1))
% q=zeros(1,m);
for i=2:1:m
    p(i-1)=i
end


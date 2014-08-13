
clc;
clear all;
close all;

input=imread('magic_salad_plate','jpg');
input=rgb2gray(input);

figure,imshow(input,[]);
imwrite(input,'magic_salad_plate.png');

input1=imread('magic_salad_plate1','jpg');
input1=rgb2gray(input1);

figure,imshow(input1,[]);
imwrite(input1,'morpmagic_salad_plate.png');
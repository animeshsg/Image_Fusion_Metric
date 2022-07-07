clc
clear all
im1=imread('img/t72a.jpg');
im2=imread('img/t72b.jpg');
figure(1);imshow(im1);
figure(2);imshow(im2);
im1=rgb2gray(im1);
im2=rgb2gray(im2);
[row col]=size(im1);
row=(int32(row/2))*2
col=(int32(col/2))*2
im1=imresize(im1,[row col]);
im2=imresize(im2,[row col]);
size(im1)
F=SWTimfuse1L_demo(double(im1),double(im2));
figure(3);imshow(uint8(F));
% im1=rgb2gray(im1);
% im2=rgb2gray(im2);
i(:,:,1)=im2;
i(:,:,2)=im1;
parm=fparam(double(i),double(F),0.9,'tan')
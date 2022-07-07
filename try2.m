clc
clear all
%M=rgb2gray(imread('try4.png'));
M=double(imread('test2/barb.tif'));
size(M)
%figure(3);imshow(M);
results=[];

for i=1:19
    if (i~=10)
     j=i/10;
     [der,dcr,dcs]=dcscalc(M,j);
     results(i,:)=[j,der,dcr,dcs];   
    end
end
results
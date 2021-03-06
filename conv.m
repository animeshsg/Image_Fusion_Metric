i=imread('try4.png');
i2=rgb2gray(i);
M1=glfedMask(3,0.9);
[w1,w2,w3,w4]=lrfedMasks(0.9);
a1=imfilter(i2,M1,'replicate');
a2=imfilter(i2,w1,'replicate');
a3=imfilter(i2,w2,'replicate');
a4=imfilter(i2,w3,'replicate');
a5=imfilter(i2,w4,'replicate');
subplot(1,6,1);
imshow(i2);
subplot(1,6,2);
imshow(a1);
subplot(1,6,3);
imshow(a2);
subplot(1,6,4);
imshow(a3);
subplot(1,6,5);
imshow(a4);
subplot(1,6,6);
imshow(a5);
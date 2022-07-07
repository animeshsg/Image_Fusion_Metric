 function [fused]=average_demo(im1,im2)
% M1 = imread('mri.jpg');
% 
% M2 = imread('ct.jpg');
% 
% M1=double(M1);
% 
% M2=double(M2);

fused=(im1 + im2) / 2;

% subplot(1,3,1);
% 
% imshow(M1,[ ]);
% 
% subplot(1,3,2);
% 
% imshow(M2,[ ]);
% 
% title('Image Fusion using Averaging');
% 
% subplot(1,3,3);

%imshow(FusedImage,[ ]);
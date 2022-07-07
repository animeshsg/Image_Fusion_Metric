function[imf] = PCA_demo(im1,im2)
% Image fusion by PCA  - demo
% by VPS Naidu, MSDF Lab, NAL, Bangalore

% insert images
% im1 = double(imread('saras51.jpg'));
% im2 = double(imread('saras52.jpg'));
%figure(1);
%subplot(121);imshow(im1,[]);
%subplot(122);imshow(im2,[]);
% compute PCA 
C = cov([im1(:) im2(:)]);
[V, D] = eig(C);
if D(1,1) >= D(2,2)
  pca = V(:,1)./sum(V(:,1));
else  
  pca = V(:,2)./sum(V(:,2));
end

% fusion
imf = pca(1)*im1 + pca(2)*im2;
%figure(2); imshow(imf,[]);

for k=1:14
    j=int2str(k);
    a=strcat('test/',j,'a.jpg');
    b=strcat('test/',j,'b.jpg');
    im1=imread(a);
    im2=imread(b);
%     im1=rgb2gray(im1);
%     im2=rgb2gray(im2);
    %size(im1);
    [row1 col1 channel]=size(im1);
    [row2 col2 channel]=size(im2);
    row1=(int32(row1/2))*2;
    col1=(int32(col1/2))*2;
    row2=(int32(row2/2))*2;
    col2=(int32(col2/2))*2;
    row=min(row1,row2);
    col=min(col1,col2);
    
    im1=imresize(im1,[row col]);
    im2=imresize(im2,[row col]);
    %size(im1)
    im1r=im1(:,:,1);
    im1g=im1(:,:,2);
    im1b=im1(:,:,3);
    
    im2r=im2(:,:,1);
    im2g=im2(:,:,2);
    im2b=im2(:,:,3);
    size(im1);
    %SWT method
    Fcr=SWTimfuse1L_demo(double(im1r),double(im2r));
    Fcg=SWTimfuse1L_demo(double(im1g),double(im2g));
    Fcb=SWTimfuse1L_demo(double(im1b),double(im2b));
    Fc=uint8(cat(3,Fcr,Fcg,Fcb));
    %PCA method
    Fdr=PCA_demo(double(im1r),double(im2r));
    Fdg=PCA_demo(double(im1g),double(im2g));
    Fdb=PCA_demo(double(im1b),double(im2b));
    Fd=uint8(cat(3,Fdr,Fdg,Fdb));
    %avg method
    Fer=average_demo(double(im1r),double(im2r));
    Feg=average_demo(double(im1g),double(im2g));
    Feb=average_demo(double(im1b),double(im2b));
    Fe=uint8(cat(3,Fer,Feg,Feb));
    size(Fc)
    size(Fd)
    size(Fe)
    c=strcat('test3/',j,'c_SWT.jpg');%SWTimfuse
    d=strcat('test3/',j,'d_PCA.jpg');%PCA
    e=strcat('test3/',j,'e_AVG.jpg');%average
    figure(1); imshow(Fc);
    figure(2); imshow(Fd);
    figure(3); imshow(Fe);
    imwrite(Fc,c);
    imwrite(Fd,d);
    imwrite(Fe,e);
end
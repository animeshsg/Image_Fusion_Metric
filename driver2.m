tan=[];
atan=[];
sig=[];
cont=[];
v=1.8;
for k=1:14
    j=int2str(k);
    a=strcat('test/',j,'a.jpg');
    b=strcat('test/',j,'b.jpg');
    im1=imread(a);
    im2=imread(b);
    im1=rgb2gray(im1);
    im2=rgb2gray(im2);
    [row1 col1]=size(im1);
    [row2 col2]=size(im2);
    row1=(int32(row1/2))*2;
    col1=(int32(col1/2))*2;
    row2=(int32(row2/2))*2;
    col2=(int32(col2/2))*2;
    row=min(row1,row2);
    col=min(col1,col2);
    im1=imresize(im1,[row col]);
    im2=imresize(im2,[row col]);
    size(im1);
    F=average_demo(double(im1),double(im2));
    %figure(3);imshow(uint8(F));
    % im1=rgb2gray(im1);
    % im2=rgb2gray(im2);
    
    i=[];
    i(:,:,1)=im2;
    i(:,:,2)=im1;
    tan(k)=fparam(double(i),double(F),v,'tan');
    atan(k)=fparam(double(i),double(F),v,'atan');
    sig(k)=fparam(double(i),double(F),v,'sigmoidal');
end
cont(:,1)=tan.';
cont(:,2)=atan.';
cont(:,3)=sig.';
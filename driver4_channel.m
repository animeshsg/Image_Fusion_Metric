tanr=[];tang=[];tanb=[];
atanr=[];atang=[];atanb=[];
sigr=[];sigg=[];sigb=[];
cont1=[];cont2=[];cont3=[];
v=1.8;
for k=1:14
    j=int2str(k);
    a=strcat('test/',j,'a.jpg');
    b=strcat('test/',j,'b.jpg');
    im1=imread(a);
    im2=imread(b);
%     im1=rgb2gray(im1);
%     im2=rgb2gray(im2);
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
    %size(im1);
    im1r=im1(:,:,1);
    im1g=im1(:,:,2);
    im1b=im1(:,:,3);
    
    im2r=im2(:,:,1);
    im2g=im2(:,:,2);
    im2b=im2(:,:,3);
    
    Fr=SWTimfuse1L_demo(double(im1r),double(im2r));
    Fg=SWTimfuse1L_demo(double(im1g),double(im2g));
    Fb=SWTimfuse1L_demo(double(im1b),double(im2b));
    
    
    %figure(3);imshow(uint8(F));
    %im1=rgb2gray(im1);
    %im2=rgb2gray(im2);
    
    
    ir=[];
    ir(:,:,1)=im2r;
    ir(:,:,2)=im1r;
    
    
    ig=[];
    ig(:,:,1)=im2g;
    ig(:,:,2)=im1g;
    
    
    ib=[];
    ib(:,:,1)=im2b;
    ib(:,:,2)=im1b;
    
    tanr(k)=fparam(double(ir),double(Fr),v,'tan');
    atanr(k)=fparam(double(ir),double(Fr),v,'atan');
    sigr(k)=fparam(double(ir),double(Fr),v,'sigmoidal');
    
    tang(k)=fparam(double(ig),double(Fg),v,'tan');
    atang(k)=fparam(double(ig),double(Fg),v,'atan');
    sigg(k)=fparam(double(ig),double(Fg),v,'sigmoidal');
    
    tanb(k)=fparam(double(ib),double(Fb),v,'tan');
    atanb(k)=fparam(double(ib),double(Fb),v,'atan');
    sigb(k)=fparam(double(ib),double(Fb),v,'sigmoidal');
    
    tana(k)=(tanr(k)+tang(k)+tanb(k))/3;
    atana(k)=(atanr(k)+atang(k)+atanb(k))/3;
    siga(k)=(sigr(k)+sigg(k)+sigb(k))/3;
end
% contr(:,1)=tanr.';contg(:,1)=tang.';contb(:,1)=tanb.';conta(:,1)=tana.';
% contr(:,2)=atanr.';contg(:,2)=atang.';contb(:,2)=atanb.';conta(:,2)=atana.';
% contr(:,3)=sigr.';contb(:,3)=sigb.';contb(:,3)=sigb.';conta(:,3)=siga.';
cont1(:,1)=tanr.';cont1(:,2)=tang.';cont1(:,3)=tanb.';cont1(:,4)=tana.';
cont2(:,1)=atanr.';cont2(:,2)=atang.';cont2(:,3)=atanb.';cont2(:,4)=atana.';
cont3(:,1)=sigr.';cont3(:,2)=sigg.';cont3(:,3)=sigb.';cont3(:,4)=siga.';
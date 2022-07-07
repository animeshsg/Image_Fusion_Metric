for k=1:10
    v=1.8;
    ji=int2str(k);
    a=strcat('test4/',ji,'.tif');
    im1=double(imread(a));
    G=[];
    t1=glfed(1,v);
    t2=glfed(2,v);
    hmask=[-t1,-t2,-t1;0,0,0;t1,t2,t1];
    vmask=[-t2,0,t2;-t1,0,t1;-t2,0,t2];
    mh=imfilter(im1,hmask,'replicate');
    mv=imfilter(im1,vmask,'replicate');
    [row col]=size(im1);
    for i=1:row
        for j=1:col
            x=mh(i,j);
            y=mv(i,j);
            g=sqrt(x^2+y^2);
            G(i,j)=g;   %eqn1
        end
    end
    S=edge(im1,'sobel');
    G=imbinarize(uint8(G));
%     figure(1);
%     imshow(S);
%     figure(2);
%     imshow(G)
   
    c=strcat('test4/',ji,'sobel.tif')%SWTimfuse
    d=strcat('test4/',ji,'mine.tif')%PCA
    ji
    
    imwrite(S,c);
    imwrite(G,d);
    
end
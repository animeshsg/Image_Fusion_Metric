function [G,A,deno] = edgeinfo(M,v)
%M is the input image for whom the edge needs to be found
%v is the order of differentiation for fractional differentiation



%M=double(M);     %mostly the input to this function will be a
%rgb value but still if it isnt uncomment the 2nd line
deno=0;
G=[];
A=[];
[row col]=size(M);
t1=glfed(1,v);
t2=glfed(2,v);
hmask=[-t1,-t2,-t1;0,0,0;t1,t2,t1];
vmask=[-t2,0,t2;-t1,0,t1;-t2,0,t2];
mh=imfilter(M,hmask,'replicate');
mv=imfilter(M,vmask,'replicate');
for i=1:row
    for j=1:col
        a=mh(i,j);
        b=mv(i,j);
        g=sqrt(a^2+b^2);
        deno=deno+g;
        G(i,j)=g;   %eqn1
        alpha=atan(b/a);
        A(i,j)=alpha;  %eqn2
    end
end
%imshow(G,[]);
return
end
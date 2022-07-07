function fparam = fparam(I,F,v,method)
%I is input vector of grayscale input images
%F is Fused images of input images
%v is the order of partial differentiation
[row col num]=size(I);
fparam=0;
deno=0;
nume=0;
for i=1:num
    [Q,den]=funparam(I(:,:,i),F,v,method);                        %control the functions used in here 
    nume=nume+Q;
    deno=deno+den;
    
end
fparam=nume/deno;
return
end
function M= glfedMask(n,v)
w=[];
p=floor(n/2);
for i=1:p
    w(i+1)=glfed(i,v);
end
w(1)=-1*8*1*w(2);
M=[w(2),w(2),w(2);w(2),w(1),w(2);w(2),w(2),w(2)];
return
end
    
    
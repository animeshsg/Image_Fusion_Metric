function [w1,w2,w3,w4]= lrfedMasks(v)
w1=[];
w2=[];
w3=[];
w4=[];
t1=glfed(1,v);
t2=glfed(2,v);
w1=[t2,0,t2;t1,0,t1;t2,0,t2];
w2=[t1,t2,0;t2,0,t2;0,t2,t1];
w3=[t1,t2,t1;0,0,0;t1,t2,t1];
w4=[0,t2,t1;t2,0,t2;t1,t2,0];
return
end

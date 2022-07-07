function [Q,deno] = sigparam(M,F,v)
% M is the input image 
% F is the fused image , fused from m
% v is the order of differentiation (0,1)




Q=0;
deno=0;
[row col]=size(M);
[Gi,Ai,di]=edgeinfo(M,v);
[Gf,Af,df]=edgeinfo(F,v);
deno=di;
for i=1:row
    for j=1:col
        gi=Gi(i,j);
        gf=Gf(i,j);
        G=0;
        if(gi>gf)
            G=gf/gi;
        else
            G=gi/gf;
        end
        
        alphai=Ai(i,j);
        alphaf=Af(i,j);
        Alpha=1-2*abs(alphai-alphaf)/pi;
        
        Qg=sigmoidal(G,0.994,15,0.5);
        Qa=sigmoidal(Alpha,0.9879,22,0.8);
        
        Qf=Qg*Qa*gi;
        Q=Q+Qf;
    end
end
Q
return
end

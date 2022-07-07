function [Q,deno] = funparam(M,F,v,method)
% M is the input image 
% F is the fused image , fused from m
% v is the order of differentiation (0,1)
qm=[];
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
        
        if strcmp(method,'atan')
                Qg=atanfunc(G,1/pi,15,0.5,0.5);
                Qa=atanfunc(Alpha,1/pi,22,0.8,0.5);
        elseif strcmp(method,'tan')
                Qg=tanfunc(G,0.5,15,0.5,0.5);
                Qa=tanfunc(Alpha,0.5,22,0.8,0.5);
        else
                Qg=sigmoidal(G,0.994,15,0.5);
                Qa=sigmoidal(Alpha,0.9879,22,0.8);
        end
        Qf=Qg*Qa*gi;
        Qf(isnan(Qf))=0;
        qm(i,j)=Qf;
        Q=Q+Qf;
    end
end
return
end

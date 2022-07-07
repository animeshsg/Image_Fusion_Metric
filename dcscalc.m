function [der,dcr,dcs]= dcscalc(M,v)
%M=rgb2gray(imread('try4.png'));
[g1,a,d]=edgeinfo(double(M),v);
g2=edge(M,'Sobel');
figure(1);imshow(uint8(g1));title('mine');
g1=imbinarize(uint8(g1));
figure(2);imshow(g2);title('sobels');
[row col]=size(g1);
dender=0;   %r(e1/e2)=pixels in e1 but not in e2
numdcr=0;   %r(e1&e2)=pixels in both e1 and e2
deno=0;
for i=1:row
    for j=1:col
        e2=g1(i,j);   %my method
        e1=g2(i,j);   %sobel method
        if (e2==1)
            deno=deno+1;
        end
        if (e1==e2)&&(e1==1)&&(e2==1)
            numdcr=numdcr+1;
        end
        if(e1~=e2)&&(e2==1)
            dender=dender+1;
        end
    end
end
der=dender/deno;
dcr=numdcr/deno;
dcs=numdcr/dender;
return
end
        
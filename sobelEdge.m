function se=sobelEdge(im1,im2,f)
    [gim1 aim1]=sobelEdgeDetection(im1); % equation 1 and 2
    [gim2 aim2]=sobelEdgeDetection(im2); % equation 1 and 2
    [gf af]=sobelEdgeDetection(f); % equation 1 and 2
    [row col]=size(im1);
    gim1f=zeros(row,col);
    gim2f=zeros(row,col);
    for i=1:row
        for j=1:col
            if(gim1(i,j)>gf(i,j))
                gim1f(i,j)=gf(i,j)/gim1(i,j); % equation 3
            else
                gim1f(i,j)=gim1(i,j)/gf(i,j);
            end
            if(gim2(i,j)>gf(i,j))
                gim2f(i,j)=gf(i,j)/gim2(i,j); % equation 3
            else
                gim2f(i,j)=gim2(i,j)/gf(i,j);
            end
        end
    end
    gim1f(isnan(gim1f))=0; 
    gim2f(isnan(gim2f))=0;
    aim1f=1-(abs(aim1-af)./(pi/2)); % equation 4
    aim1f(find(aim1f==1))=0;
    aim2f=1-(abs(aim2-af)./(pi/2)); % equation 4
    aim2f(find(aim2f==1))=0;
    t=gim1f-0.5;
    t(find(t==-0.5))=0;
    t=-15*t;
    for i=1:row
        for j=1:col
            if(t(i,j)~=0)
                t4=2.71^t(i,j);
                qim1fg(i,j)=(0.9994/(1+t4)); % equation 5
            else
                qim1fg(i,j)=0;
            end
        end
    end
    qim1fg(isnan(qim1fg))=0;
    t=gim2f-0.5;
    t(find(t==-0.5))=0;
    t=-15*t;
    for i=1:row
        for j=1:col
            if(t(i,j)~=0)
                t4=2.71^t(i,j);
                qim2fg(i,j)=(0.9994/(1+t4)); % equation 5
            else
                qim2fg(i,j)=0;
            end
        end
    end
    qim2fg(isnan(qim2fg))=0;
    t=aim1f-0.8;
    t(find(t==-0.8))=0;
    t=-22*t;
    for i=1:row
        for j=1:col
            if(t(i,j)~=0)
                t4=2.71^t(i,j);
                qim1fa(i,j)=(0.9879/(1+t4)); % equation 6
            else
                qim1fa(i,j)=0;
            end
        end
    end
    t=aim2f-0.8;
    t(find(t==-0.8))=0;
    t=-22*t;
    for i=1:row
        for j=1:col
            if(t(i,j)~=0)
                t4=2.71^t(i,j);
                qim2fa(i,j)=(0.9879/(1+t4)); % equation 6
            else
                qim2fa(i,j)=0;
            end
        end
    end
    qim1f=qim1fg.*qim1fa; % equation 7
    qim2f=qim2fg.*qim2fa; % equation 7
    wim1=gim1;
    wim2=gim2;
    t1=wim1+wim2;
    t2=qim1f+qim2f;
    qpim1im2f=sum(t2(:))/sum(t1(:)); % equation 8
    se=qpim1im2f;
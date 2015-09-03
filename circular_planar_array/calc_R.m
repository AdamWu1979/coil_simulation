function [R]=calc_R(A,ne,radc,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz)

%
% This function calculates the mutual impedence caused by sample
% A = magnetic potential vector
% ne = number of elements
% radc = cylinder radius
% xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz = request limits and precision 
% R = matrix 2-D


global u0 cond freq;
omega=2*pi*freq;

%generate sample mask
xsample=xpmin:px:xpmax;
ysample=ypmin:py:ypmax;
zsample=zpmin:pz:zpmax;

Msk(1:size(xsample),1,1:size(zsample))=ones;

% here we define the mask
for gg=1:1:size(Msk,2)
    Mskd(:,:)=Msk(:,gg,:);
    
    for ii=1:1:size(xsample,2)
        for jj=1:1:size(zsample,2)
            d= sqrt((xsample(ii)-0)^2+(zsample(jj)-radc)^2);
            if d<=radc
                g(ii,jj)=1;
            else
                g(ii,jj)=0;
            end
        end
    end
    
    Mskf=Mskd.*g;
    
    hh=1;
    for ii=1:1:size(Mskf,1)
        for jj=1:1:size(Mskf,2)
            if  Mskf(ii,jj)~=0;
                px(hh)=ii;
                py(hh)=jj;
                hh=hh+1;
            end
        end
    end
end

% compute R
R = zeros(ne,ne);
for ii=1:1:ne
    for jj=1:1:ne
        Ai(:,:)=A(:,1,:,ii);
        Aj(:,:)=A(:,1,:,jj);
        
        cAi= Ai.*Mskf;
        cAj= Aj.*Mskf;
        
        % integrate over mask
        R(ii,jj) = cond*(omega^2)*(sum(sum(cAj.*cAi)));
        
    end
end
end

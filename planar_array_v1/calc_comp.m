function [B1,Bx,By,Bz,xp,yp,zp]=calc_comp(array,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz)
h = waitbar(0,'Please wait...');
for gg=1:1:ne
    [Bbuff,Bxbuff,Bybuff,Bzbuff,xp,yp,zp]=calc_field(array,gg,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);
    
    perc=gg/ne;
    waitbar(perc,h,sprintf('%d%% '))
    B1(:,:,:,gg)=Bbuff(:,:,:);
    Bx(:,:,:,gg)=Bxbuff(:,:,:);
    By(:,:,:,gg)=Bybuff(:,:,:);
    Bz(:,:,:,gg)=Bzbuff(:,:,:);
    
    clear Bbuff Bxbuff Bybuff Bzbuff;
end
close(h);
end
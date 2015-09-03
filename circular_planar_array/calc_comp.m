function [B1,Bx,By,Bz,Ax,Ay,Az,A,xp,yp,zp]=calc_comp(array,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz)
%
% This function computes the B1 field and A magnetic vector potential for
% each coil

h = waitbar(0,'Please wait...');

%loop over the array
for gg=1:1:ne
    
    [Bbuff,Bxbuff,Bybuff,Bzbuff,Axbuff,Aybuff,Azbuff,Abuff,xp,yp,zp]=calc_field(array,gg,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);
    
    perc=gg/ne;
    waitbar(perc,h,sprintf('%d%% '))
    B1(:,:,:,gg)=Bbuff(:,:,:);
    Bx(:,:,:,gg)=Bxbuff(:,:,:);
    By(:,:,:,gg)=Bybuff(:,:,:);
    Bz(:,:,:,gg)=Bzbuff(:,:,:);
    
    Ax(:,:,:,gg)=Axbuff(:,:,:);
    Ay(:,:,:,gg)=Aybuff(:,:,:);
    Az(:,:,:,gg)=Azbuff(:,:,:);
    
    A(:,:,:,gg)=Abuff(:,:,:);    
    
    clear Bbuff Bxbuff Bybuff Bzbuff Axbuff Aybuff Azbuff Abuff;
end
close(h);
end
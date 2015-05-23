function [B1f,Bxf,Byf,Bzf]=calc_array(Bx,By,Bz,B1,ne)
Bxf=0;
Byf=0;
Bzf=0;
B1f=0;
for ii=1:1:ne
    Bxf=sqrt(Bxf.^2+Bx(:,:,:,ii).^2);
    Byf=sqrt(Byf.^2+By(:,:,:,ii).^2);
    Bzf=sqrt(Bzf.^2+Bz(:,:,:,ii).^2);
    B1f=sqrt(B1f.^2+B1(:,:,:,ii).^2);
end
end
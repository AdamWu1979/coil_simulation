function [telem]=translation(arrayr,xin,en,radc)
%
% This function computes the translated elements
% arrayr = rotated coil array
% xin = X initial position
% en = element number
% radc = cylinder radius
% telem = matrix 2-D
%generate translation matrix
Tx=xin(en);
Ty=0;
Tz=radc-cos(asin(xin(en)/radc))*radc;
Tr=([1 0 0 Tx; 0 1 0 Ty; 0 0 1 Tz; 0 0 0 1]);

x=arrayr(1,:,en);
y=arrayr(2,:,en);
z=arrayr(3,:,en);

ll=ones(size(arrayr,2));
lf=ll(1,:);
ptm=[x;y;z;lf];

move=Tr*ptm; %compute the translation

telem(1,:)=move(1,:);
telem(2,:)=move(2,:);
telem(3,:)=move(3,:);
end
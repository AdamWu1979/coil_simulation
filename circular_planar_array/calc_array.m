function [B1f]=calc_final_field(B1,ne)
%
% This function computes the resultant B1 field of the array
B1f=0;

for ii=1:1:ne
    B1f=sqrt(B1f.^2+B1(:,:,:,ii).^2);
    
end
end
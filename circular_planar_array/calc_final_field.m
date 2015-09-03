function [B1f]=calc_final_field(B1,ne)
%
% This function computes the resultant field of the array
% B1 = magnetic field of each coil
% ne = number of coils

B1f=0;

%loop adding each coil
for ii=1:1:ne
    B1f=sqrt(B1f.^2+B1(:,:,:,ii).^2);
    end
end
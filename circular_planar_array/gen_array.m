function [array]=gen_array(rada,radb,xin,yin,zin,ne)
%
% This function computes the array including all information about the elements:
% rada = coil radius along X-axis
% radb = coil radius along Y-axis
% xin = initial X position of the element
% yin = initial Y position of the element
% zin = initial Z position of the element
% ne = the number of elements

for i=1:1:ne  %generate array information
 [coil]=gen_coil(rada(i),radb(i),xin(i),yin(i),zin(i));
 array(:,:,i)=coil(:,:); %matrix 3-D
end
end
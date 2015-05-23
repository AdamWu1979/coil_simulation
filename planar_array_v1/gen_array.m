function [array]=gen_array(rada,radb,xin,yin,zin,ne)
for i=1:1:ne  %generate array information
 [coil]=gen_coil(rada(i),radb(i),xin(i),yin(i),zin(i));
 array(:,:,i)=coil(:,:,:);
end
end
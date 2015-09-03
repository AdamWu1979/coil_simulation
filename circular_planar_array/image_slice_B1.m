function image_slice_B1(xp,zp,B1f)
%
% This function show slice image of SNR & B1 field

close all;
%rotate image
B1f=B1f.';

%flip image
top=size(B1f,1);
for kk=0:1:top-1;
    B1_flipped(kk+1,:)=B1f(top-kk,:);
end

%plot B1 field
figure()
imagesc(B1_flipped)
title('B1 sensitivity profile')
xlabel('X-axis [cm]')
ylabel('Z-axis [cm]')
grid on;
colorbar;
t = colorbar('peer',gca);
set(get(t,'Ylabel'),'String', '[Tesla]');
%redefine X&Y Tick&Label for the case radius cylinder=80mm; 
%set(gca,'YTick', [1 11 21 31 41 51 61 71 81],'YTickLabel', {'160','140','120','100','80','60','40','20','0'});
%set(gca,'XTick', [1 11 21 31 41 51 61 71 81],'XTickLabel', {'-80','-60','-40','-20','0','20','40','60','80'});

end

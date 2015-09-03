function image_slice_SNR_B1(xp,zp,radc,SNR,B1f)
%
% This function show slice image of SNR & B1 field

close all;

%generate mask i.e. ROI is the interior of the cylinder
for ii=1:1:size(xp,2)
    for jj=1:1:size(zp,2)
        d= sqrt((xp(ii)-0)^2+(zp(jj)-radc)^2);
        if d<=radc
            g(ii,jj)=1;
        else
            g(ii,jj)=0;
        end
    end
end

% Multiply SNR with mask
pSNR=SNR.*g;
pSNR=pSNR.';
pB1f=B1f.*g;
pB1f=pB1f.';

hh=1;
% loop to determine the margins around the cylinder
for ii=1:1:size(pSNR,1)
    for jj=1:1:size(pSNR,2)
        if  pSNR(ii,jj)~=0;
            px(hh)=ii;
            py(hh)=jj;
            hh=hh+1;
        end
    end
end
cropped_SNR=pSNR(min(px):max(px),min(py):max(py));
cropped_B1=pB1f(min(px):max(px),min(py):max(py));

%flip image
top=size(cropped_SNR,1);
for kk=0:1:top-1;
    SNR_flipped(kk+1,:)=cropped_SNR(top-kk,:);
end
for kk=0:1:top-1;
    B1_flipped(kk+1,:)=cropped_B1(top-kk,:);
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
set(gca,'YTick', [1 11 21 31 41 51 61 71 81],'YTickLabel', {'160','140','120','100','80','60','40','20','0'});
set(gca,'XTick', [1 11 21 31 41 51 61 71 81],'XTickLabel', {'-80','-60','-40','-20','0','20','40','60','80'});

%plot SNR/SNR max
figure()
imagesc((SNR_flipped/max(max(SNR_flipped))))
title('SNR/SNR max')
%redefine X&Y Tick&Label for the case radius cylinder=80mm;
set(gca,'YTick', [1 11 21 31 41 51 61 71 81],'YTickLabel', {'160','140','120','100','80','60','40','20','0'});
set(gca,'XTick', [1 11 21 31 41 51 61 71 81],'XTickLabel', {'-80','-60','-40','-20','0','20','40','60','80'});
xlabel('X-axis [cm]')
ylabel('Z-axis [cm]')
grid on;
colorbar;
end

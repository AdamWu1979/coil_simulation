function [ypmin,ypmax,py]=f_req_y()
%
% This function returns the limits and the precision of the field request
% for Y axis

prompt={'Ymin in cm:','Ymax in cm:',...
    'Precision in cm:'};
answer=inputdlg(prompt,'Y axis request');
ypmin=str2num(answer{1})*0.01; %transform cm to m
ypmax=str2num(answer{2})*0.01;
py=str2num(answer{3})*0.01;
end
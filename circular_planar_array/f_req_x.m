function [xpmin,xpmax,px]=f_req_x()
%
% This function returns the limits and the precision of the field request
% for X axis

prompt={'Xmin in cm:','Xmax in cm:',...
    'Precision in cm:'};
answer=inputdlg(prompt,'X axis request');
xpmin=str2num(answer{1})*0.01; %transform cm to m
xpmax=str2num(answer{2})*0.01;
px=str2num(answer{3})*0.01;
end
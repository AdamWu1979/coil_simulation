function [zpmin,zpmax,pz]=f_req_z()

%
% This function returns the limits and the precision of the field request
% for Z axis

prompt={'Zmin in cm:','Zmax in cm:',...
    'Precision in cm:'};
answer=inputdlg(prompt,'Z axis request');
zpmin=str2num(answer{1})*0.01; %transform cm to m 
zpmax=str2num(answer{2})*0.01;
pz=str2num(answer{3})*0.01;
end
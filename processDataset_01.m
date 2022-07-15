clc; clear; close all;
format compact

%% Merged Sprocessed files
dir = 'dataset/Sprocessed/';
fileName ='S00';
S_merged = mergeCSVFiles(dir,fileName);
% Adding label on 179th column
label = ones(2300,1);
S_merged =[S_merged label];

%% Merged Fprocessed files
dir = 'dataset/Fprocessed/';
fileName ='F00';
F_merged = mergeCSVFiles(dir,fileName);
% Adding label on 179th column
label = 2*ones(2300,1);
F_merged =[F_merged label];

%% Merged Nprocessed files
dir = 'dataset/Nprocessed/';
fileName ='N00';
N_merged = mergeCSVFiles(dir,fileName);
% Adding label on 179th column
label = 3*ones(2300,1);
N_merged =[N_merged label];
%csvwrite('mergedFiles/N_merged.csv', N_merged);

%% Merged Oprocessed files
dir = 'dataset/Oprocessed/';
fileName ='O00';
O_merged = mergeCSVFiles(dir,fileName);
% Adding label on 179th column
label = 4*ones(2300,1);
O_merged =[O_merged label];


%% Merged Zprocessed files
dir = 'dataset/Zprocessed/';
fileName ='Z00';
Z_merged = mergeCSVFiles(dir,fileName);
% Adding label on 179th column
label = 5*ones(2300,1);
Z_merged =[Z_merged label];

%% Merging all the merged files into one file
%Merging all the files
mergedAllFile = [S_merged; F_merged; N_merged; O_merged; Z_merged];

% Generating column names
cols = ["X1","X2"];
for i = 3:178
    c = append("X",string(i));
    cols(i) = c;
end
cols(179) = "y";

MT =table(mergedAllFile);                          % Generating table with values
writetable(MT,'mergedFiles/mergedTable.csv');     
MT = readtable('mergedFiles/mergedTable.csv');     % Read the created table to make changes
MT.Properties.VariableNames = cols;                % Change the column names
writetable(MT,'mergedFiles/mergedTable.csv');      % Overwrite the file with correct column names

data = readtable('mergedFiles/mergedTable.csv');   % read the table to use this



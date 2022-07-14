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
mergedAllFile = [S_merged; F_merged; N_merged; O_merged; Z_merged];
mkdir('mergedFiles')
csvwrite('mergedFiles/MergedAllFiles.csv', mergedAllFile);
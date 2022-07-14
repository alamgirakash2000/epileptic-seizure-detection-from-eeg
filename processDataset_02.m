clc; clear; close all;
format compact;

% Merged All the CSV files
M = csvread('mergedFiles/MergedAllFiles.csv');

for i = 1:length(M)
    if(M(i,179)~=1)
        M(i,179)=0;
    end
end


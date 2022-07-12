clc; clear; close all;
format compact;

% Loading all the csv files
S_merged = csvread('mergedFiles/S_merged.csv');
F_merged = csvread('mergedFiles/F_merged.csv');
N_merged = csvread('mergedFiles/N_merged.csv');
O_merged = csvread('mergedFiles/O_merged.csv');
Z_merged = csvread('mergedFiles/Z_merged.csv');

% Merged All the CSV files
mergedAllFile = [S_merged; F_merged; N_merged; O_merged; Z_merged];
csvwrite('mergedFiles/MergedAllFiles.csv', mergedAllFile);

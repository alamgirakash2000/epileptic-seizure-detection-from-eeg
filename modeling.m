clc; clear; close all;
format compact;

% Importing main processed dataset
readData = readtable('mergedFiles/mergedTable.csv'); 

% Normalizing the dataset
data = normalizedDataset(readData);

% Partitioning Dataset
cv = cvpartition(size(data,1),'HoldOut',0.2);
idx = cv.test;
dataTrain = data(~idx,:);
dataTest = data(idx,:);
testing = dataTest(1:end, 1:end-1);

%%Modeling
% Decision Tree
model1 = fitctree(dataTrain,"y");
prediction=predict(model1,testing);
ms = (sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Decision Tree Accuracy: %.2f %% \n',ms)

% Random Forest
model2=fitensemble(dataTrain,'y','Bag',100,'Tree','Type','classification');
prediction=predict(model2,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Random Forest Accuracy: %.2f %% \n',ms)

%% Test with one signle dataset
dir = 'dataset/Nprocessed/N098.csv';
res = predictWithSignleReading(dir, model2)

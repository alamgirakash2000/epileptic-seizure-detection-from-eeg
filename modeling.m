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
%model1 =fitctree(dataTrain,'y','OptimizeHyperparameters','auto');
model1 =fitctree(dataTrain,'y');
prediction=predict(model1,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Decision tree Accuracy: %.2f %% \n',ms)

%Random Forest
model2=fitensemble(dataTrain,'y','Bag',70,'Tree','Type','classification');
prediction=predict(model2,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Random Forest Accuracy: %.2f %% \n',ms)

%% Test with a full folder
clc; close all;
model = model2;
actual_output = [zeros(1,400) ones(1,100)];
predictions=testWithAllFiles(model);

% Confussion Chart
cc = confusionchart(actual_output,predictions);
cc.Title = 'Confussion Matrix For Seizure Detection (500 Samples)';
cc.RowSummary= 'row-normalized';

% Stats of Measure
cm = confusionmat(actual_output,predictions);
statsOfMeasure(cm,1);



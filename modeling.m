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
%% model1 =fitctree(dataTrain,'y','OptimizeHyperparameters','auto');
model1 =fitctree(dataTrain,'y');
prediction=predict(model1,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Decision tree Accuracy: %.2f %% \n',ms)
confusionMatrixAndScores(table2array(dataTest(:,end)), prediction,'Confussion Matrix For per second Data using Decision Tree')

%% Random Forest
model2=fitensemble(dataTrain,'y','Bag',70,'Tree','Type','classification');
prediction=predict(model2,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100;
fprintf('Random Forest Accuracy: %.2f %% \n',ms)
confusionMatrixAndScores(table2array(dataTest(:,end)), prediction,'Confussion Matrix For per second Data using Random Forrest')


%% Final test over all the files by Decision tree
%clc; close all;
model = model1;
actual_output = [zeros(1,400) ones(1,100)];
predictions=testWithAllFiles(model);

confusionMatrixAndScores(actual_output, predictions,'Overall Confussion Matrix For Decision Tree (500 Samples)')

%% Final test over all the files by Random Forrest
%clc; close all;
model = model2;
actual_output = [zeros(1,400) ones(1,100)];
predictions=testWithAllFiles(model);

confusionMatrixAndScores(actual_output, predictions,'Overall Confussion Matrix For Random Forrest (500 Samples)')


%% Final test over unseed data by Decision tree
%clc; close all;
model = model1;
actual_output = [zeros(1,40) ones(1,10)];
predictions=testWithTestingFiles(model);

confusionMatrixAndScores(actual_output, predictions,'Confussion Matrix of Test files For Decision Tree (50 Samples)')

%% Final test over unseen data by Random Forrest
%clc; close all;
model = model2;
actual_output = [zeros(1,40) ones(1,10)];
predictions=testWithTestingFiles(model);

confusionMatrixAndScores(actual_output, predictions,'Confussion Matrix of Test files For Random Forrest (50 Samples)')



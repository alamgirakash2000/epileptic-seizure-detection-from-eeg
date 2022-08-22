function [p]= testWithAllFiles(model)
dir = 'dataset/Sprocessed/';
fileName ='S00';
%k = ['F','N','O','S','Z']
predictions = [];

for k = ['F','N','O','Z','S']
    preds = [];
    dir(9)= k;
    fileName(1) = k;
    sum = 0;
    file = append(dir,fileName,string(1),'.csv');   % Specifying the filename
    pred = predictWithSignleReading(file, model);
    preds = [preds pred];
    sum = sum+pred;
    
    % Process TXT file from 002 to 009
    for i = 2:9
        fileNumber =i;
        file = append(dir,fileName,string(fileNumber),'.csv');
        pred = predictWithSignleReading(file, model);
        preds = [preds pred];
        sum = sum+pred;
    end
    
    % Process TXT file from 010 to 099
    for j = 10:99
        fileNumber =j;
        file = append(dir,fileName(1:2),string(fileNumber),'.csv');
        pred = predictWithSignleReading(file, model);
        preds = [preds pred];
        sum = sum+pred;
    end
    
    % Process TXT file No. 100
    file = append(dir,fileName(1),string(100),'.csv');   % Specifying the filename
    pred = predictWithSignleReading(file, model);
    preds = [preds pred];
    sum = sum+pred;
    
    % Print the result
    fprintf("Seizure Activity on %c detected for %d files \n",k,sum)
    predictions = [predictions preds];
end
p = predictions;
end
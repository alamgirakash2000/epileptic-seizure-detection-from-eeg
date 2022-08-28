function [p]= testWithTestingFiles(model)
dir = 'dataset/Sprocessed/';
fileName ='S00';
%k = ['F','N','O','S','Z']
predictions = [];

for k = ['F','N','O','Z','S']
    preds = [];
    dir(9)= k;
    fileName(1) = k;
    sum = 0;
    
    % Process TXT file from 010 to 099
    for j = 90:99
        fileNumber =j;
        file = append(dir,fileName(1:2),string(fileNumber),'.csv');
        pred = predictWithSignleReading(file, model);
        preds = [preds pred];
        sum = sum+pred;
    end
   
    predictions = [predictions preds];
end
p = predictions;
end
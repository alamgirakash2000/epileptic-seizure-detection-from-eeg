function []= testWithAllFiles(model)
dir = 'dataset/Sprocessed/';
fileName ='S00';
%k = ['F','N','O','S','Z']
for k = ['F']
    dir(9)= k;
    fileName(1) = k;
    sum = 0;
    file = append(dir,fileName,string(1),'.csv');   % Specifying the filename
    sum = sum+predictWithSignleReading(file, model);
    
    % Process TXT file from 002 to 009
    for i = 2:9
        fileNumber =i;
        file = append(dir,fileName,string(fileNumber),'.csv');
        sum = sum+predictWithSignleReading(file, model);
    end
    
    % Process TXT file from 010 to 099
    for j = 10:94
        fileNumber =j;
        file = append(dir,fileName(1:2),string(fileNumber),'.csv');
        sum = sum+predictWithSignleReading(file, model);
    end
    
    % Process TXT file No. 100
    file = append(dir,fileName(1),string(100),'.csv');   % Specifying the filename
    sum = sum+predictWithSignleReading(file, model);
    fprintf("Seizure Activity on %c detected for %d files \n",k,sum)
end
end
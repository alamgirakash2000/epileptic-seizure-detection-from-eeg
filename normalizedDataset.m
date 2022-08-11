function [normData] = normalizedDataset(data)
processedData = data;

% Relabeling the data
lastColumn_y = table2array(data(:,end));
lastColumn_y = lastColumn_y==1;
lastColumn_y = array2table(lastColumn_y);
processedData(:,end) = lastColumn_y;

% Normalizing the dataset
processedData(:,1:end-1)=normalize(processedData(:,1:end-1));
normData = processedData;
end

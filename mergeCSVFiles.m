function mergedFile = mergeCSVFiles(dir,fileName)
%%This function is for processing all 100 Txt file of a folder and making
%%a merged file of 2300x178 dimension

% Process TXT file No. 001
file = append(dir,fileName,string(1),'.csv');   % Specifying the filename
merged = oneTo178Columns(file);

% Process TXT file from 002 to 009
for i = 2:9
    fileNumber =i;
    file = append(dir,fileName,string(fileNumber),'.csv');
    merged = [merged; oneTo178Columns(file)];
end

% Process TXT file from 010 to 099
for j = 10:90
    fileNumber =j;
    file = append(dir,fileName(1:2),string(fileNumber),'.csv');
    merged = [merged; oneTo178Columns(file)];
end

% Process TXT file No. 100
file = append(dir,fileName(1),string(100),'.csv');   % Specifying the filename
merged = [merged; oneTo178Columns(file)];

mergedFile = merged;
end
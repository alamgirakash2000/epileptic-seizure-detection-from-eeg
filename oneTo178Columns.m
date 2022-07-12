function processedFile =  oneTo178Columns(csvfile)
%THis is the first function which is used to convert the raw txt file of
%4097 columns to 178 columns and 23 rows, each row indicates the data of 1 seconds 
M = csvread(csvfile);
M =M';
cols = 178;
new = M(1:cols);
for i = 1:22
    new = [new; M(i*cols+1:(i+1)*cols)];
end
processedFile = new;
end
function [res] = predictWithSignleReading(dir, model)
%%This function is used for predict seizure activity with one single
%%reading of total 23 seconds (4097 data) 
signleReading=oneTo178Columns(dir);
sr_normalized = normalize(signleReading);
signleReading =array2table(sr_normalized);  

% Generating column names
cols = ["X1","X2"];
for i = 3:178
    c = append("X",string(i));
    cols(i) = c;
end
signleReading.Properties.VariableNames = cols;   
prediction=predict(model,signleReading);

pred = sum(prediction)*100/23;

if (pred>75)
    fprintf("Seizure Detected with %.2f %% confidence \n", pred);
else
    fprintf("No-Seizure Activity detected \n");
end
res = sum(prediction);
end
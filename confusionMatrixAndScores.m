function []=confusionMatrixAndScores(actual_output,predictions, title)
figure()
% Confussion Chart
cc = confusionchart(actual_output,predictions);
cc.Title = title;
cc.FontSize=30;
cc.RowSummary= 'row-normalized';

% Stats of Measure
cm = confusionmat(actual_output,predictions);
disp(title);
statsOfMeasure(cm,1);
end
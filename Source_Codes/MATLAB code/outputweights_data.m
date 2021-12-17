
%save the workshop first with save command and name the .mat file
%clear;
%replace name with your saved file
%load data;

%matrix_max = max(max(outputWeights))
%matrix_min = min(min(outputWeights))

[column_max,index_line_max]= max(outputWeights);

[matrix_max,index_column_max]= max(column_max);

m_max=index_line_max(index_column_max);
n_max=index_column_max;

fprintf('outputWeights:\n')
fprintf('The max number is %f,\n', matrix_max');
fprintf('The max number is @ line %d, column %d.\n', m_max,n_max');


[column_min,index_line_min]= min(outputWeights);

[matrix_min,index_column_min]= min(column_min);

m_min=index_line_min(index_column_min);
n_min=index_column_min;

fprintf('The min number is %f,\n', matrix_min');
fprintf('The min number is @ line %d, column %d.\n', m_min, n_min');
fprintf('Attention:The result just shows one location of the max/min numbers. There maybe more than one max/min\n')
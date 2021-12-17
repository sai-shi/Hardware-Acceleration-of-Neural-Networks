function [ output ] = myrounding( input, bound )
% stochastic rounding according to the precision
precision = 6;
scale = 2^precision;
inner_precision = 4;
inner_scale = 2^inner_precision;
temp = input/bound*scale;
output = floor(temp);
temp=round((temp-output)*inner_scale)/inner_scale;
output=output+(rand(size(input))<temp);
output=output/scale*bound;
end


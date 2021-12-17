function [ delta ] = effect_round( delta )
% round to certain number of effective bits
bits = 3;
precision = floor(-log2(abs(delta(delta~=0))));
precision = 2.^(-precision-bits);
delta(delta~=0) = round(delta(delta~=0)./precision).*precision;

end


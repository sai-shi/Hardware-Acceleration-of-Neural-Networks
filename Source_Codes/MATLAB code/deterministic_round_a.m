%So this is deterministic rouding that can take care of a sting of 1
%separately: 0.000111 is rounded to 0.001 instead of 0.0001 when rounding
%to 4 bits. will see this case too for comparison in _b
function [ delta ] = deterministic_round_a( delta , bitsround )
%bitsround = ;
format long

precsig = 2.^(-(bitsround));
%for standard deterministic:
delta(delta~=0) = round((delta(delta~=0))./precsig).*precsig;

end
%So this is stochastic weighted rouding with last bit fluctuating
function[ delta ] = stochastic_round_weighted_1bit_4bitafter_du(delta , bitsround )
    
    format long
    
        precsig = 2.^(-(bitsround));

        precsig1 = 2.^(-(bitsround+1));
        precsig2 = 2.^(-(bitsround+2));
        precsig3 = 2.^(-(bitsround+3));
        precsig4 = 2.^(-(bitsround+4));

        delta1 = floor((delta)./(precsig)).*(precsig);
        delta2 = floor((delta)./(precsig4)).*(precsig4);
        diff=delta2-delta1;

        upper_limit=0;
            for i=(bitsround+1):(bitsround+4)
                upper_limit = upper_limit + 1/(2^(i));
            end

        weight1=diff./upper_limit;
        m = size(delta,1); 
        n = size(delta,2);
        rnd=unifrnd(0,1,[m,n]);
        bitn=rnd<weight1;

        delta = delta1 + bitn.*precsig;
   
        
        
end
%So this is stochastic weighted rouding with last bit fluctuating
function[ delta ] = stochastic_round_weighted_1bit_allbitafter_du(delta , bitsround )
    
    format long

    precsig = 2.^(-(bitsround));
    delta1 = floor((delta)./(precsig)).*(precsig);
    diff=delta-delta1;
    
    upper_limit=0;
        for i=(bitsround+1):16
            upper_limit = upper_limit + 1/(2^(i));
        end

    weight1=diff./upper_limit;
    m = size(delta,1); 
    n = size(delta,2);
   
    rnd=unifrnd(0,1,[m,n]);
    bitn=rnd<weight1;
    
    delta = delta1 + bitn.*precsig;
end
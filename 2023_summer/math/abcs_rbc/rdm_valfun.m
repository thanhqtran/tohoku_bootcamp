function val=rdm_valfun(k)
    global vlast beta delta theta k0 kt 
    %smooth out the previous value function 
    g = interp1(k0, vlast, k, 'linear');
    %calculate consumption with given params 
    kk = kt^theta - k + (1-delta)*kt;
    if kk <= 0
        %trick to keep values from going negative 
        val = -888-800*abs(kk);
    else 
        %calculate the value of the value function at k 
        val = log(kk) + beta*g;
    end
%change the value of negative since "fminbnd" finds minimum 
val = -val;
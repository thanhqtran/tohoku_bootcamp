# functions to solve k[s] given k[s+1] and k[s+2]
# going to use for s = 59, 58, ..., 41
function solve_ks_old(ks1, ks2)
    ks = (1 / (1 + r)) * ((beta * (1 + r))^(1 / eta) * ((1 + r) * ks1 + b - ks2 + psi) - (b - ks1 + psi))
    return ks
end

# at s = 40, given ks41 and ns41, solve ks40 and ns40
function fs40!(F, X, ks1, ks2)
    ns1 = 0
    ks, ns = X
    F[1] = (1 - tau) * w * (1 - ns) / gamma - ((1 + r) * ks + (1 - tau) * w * ns - ks1 + psi)
    F[2] = 1 / beta - (((1 + r) * ks1 + (1 - tau) * w * ns1 - ks2 + psi) / ((1 + r) * ks + (1 - tau) * w * ns - ks1 + psi))^(-eta) * (((1 - ns1) / (1 - ns))^(gamma / (1 - eta))) * (1 + r)
end

# at s = 39, 38, ... , 1, given ks[s+1], ns[s+1], ks[s+2], solve ks[s] and ns[s]
function fs_young!(F, X, ks1, ns1, ks2)
    ks, ns = X
    F[1] = (1 - tau) * w * (1 - ns) / gamma - ((1 + r) * ks + (1 - tau) * w * ns - ks1 + psi)
    F[2] = 1 / beta - (((1 + r) * ks1 + (1 - tau) * w * ns1 - ks2 + psi) / ((1 + r) * ks + (1 - tau) * w * ns - ks1 + psi))^(-eta) * (((1 - ns1) / (1 - ns))^(gamma / (1 - eta))) * (1 + r)
end

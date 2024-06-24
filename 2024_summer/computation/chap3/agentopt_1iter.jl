# AN EXAMPLE OF AN ITERATION
# an empty array to store the results
ks = zeros(61)
ns = zeros(61)

ks[61] = 0
ns[61] = 0

# guess for k[60]
ks[60] = 0.2
for s in 59:-1:1
    if s >= 41
        # at s = 59, 58, ..., 41, given k[s+1] and k[s+2], solve k[s]
        ks[s] = solve_ks_old(ks[s+1], ks[s+2])
        ns[s] = 0
    elseif s == 40
        # at s = 40, given k41 and n41, solve k40 and n40
        result = nlsolve((F, X) -> fs40!(F, X, ks[s+1], ks[s+2]), [ks[s+1], ns[s+1]])
        ks[s] = result.zero[1]
        ns[s] = result.zero[2]
    else
        # at s = 39, 38, ..., 1, given k[s+1] and n[s+1], solve k[s] and n[s]
        result = nlsolve((F, X) -> fs_young!(F, X, ks[s+1], ns[s+1], ks[s+2]), [ks[s+1], ns[s+1]])
        ks[s] = result.zero[1]
        ns[s] = result.zero[2]
    end
end

print(ks[1])
plot(ks)

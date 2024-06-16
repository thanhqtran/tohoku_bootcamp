global vlast beta delta theta k0 kt
hold off 
hold all 
%set initial conditions 
vlast = zeros(1,100);
k0 = 0.06:0.06:6;
beta = .98;
delta = .1;
theta = .36;
numits = 240;
%begin recursive calculations
for k = 1:numits
    for j = 1:100
        kt = j*.06;
        %find the maximum of the value function 
        ktp1 = fminbnd(@rdm_valfun, 0.01, 6.2);
        v(j) = -rdm_valfun(ktp1);
        kt1(j) = ktp1;
    end
    if k/48 == round(k/48)
        %plot the steps in finding the value function
        plot(k0, v)
        drawnow
    end
    vlast = v;
end 
hold off 
%plot the final policy function 
plot(k0, kt1)
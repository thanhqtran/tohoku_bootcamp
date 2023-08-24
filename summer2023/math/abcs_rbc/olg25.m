kappa = 4;
theta = .36;
roe = .9;
K0 = [ .8*kappa^(1/(1-theta))
        kappa^(1/(1-theta))
        1.2*kappa^(1/(1-theta))];
lambda(1:3,1) = [1 1 1]';
K(1:3,1) = K0;
Y(:,1) = lambda(:,1).*K(:,1).^theta.*65.^(1-theta);
for i=2:118
    lambda(:,i) = (1-roe)+roe.*lambda(:,i-1)+.02.*(rand(3,1)-.5);
    K(:,i)=kappa.*lambda(:,i).*K(:,i-1).^theta;
    Y(:,i) = lambda(:,i).*K(:,i-1).^theta.*65.^(1-theta);
end
subplot(2,1,1),plot(K')
subplot(2,1,2),plot(Y')
%% the Schwarz-Christoffel Tranformation to get Impedance of Strip-line %%

e = 8.854*(10^-(12));
u = 0.125 % value of d/a
%evaluating the value of x0
m = @(u) cosh(pi*u/4)  
x = @(u) m(u).^2  
k = @(u) x(u).^(-1/2)
p = @(u) k(u).^2

b=@(lambda) lambda.^2
c=@(lambda) p(u)*b(lambda)
fu = @(lambda) 1./((1-b(lambda)).*(1-c(lambda))).^(1/2) %evaluate K
fuu = @(lambda) 1./((b(lambda)-1).*(1-c(lambda))).^(1/2) %evaluate K'
K = integral(fu,0,1)  %value of K
Q = integral(fuu,1,1/k(u)) %value of K'
Vo = K/Q
Zc = 30*pi*Vo
x = m(u).^2
C = 4.*e./Vo

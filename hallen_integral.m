%% Hallen's Integral Ref: Antenna-Theory-by-Balanis, sec: 8.3.2%%
f=1*10^9;
lam=3*10^8/f;
k=2*pi/lam;
l=lam/2;
a=.001*lam;
delz=l/200;
for i=1:201
    z(i)=delz*(i-1)-l/2;
    for j=1:201
       zp(j)=delz*(j-1)-l/2;
       range(i,j)=sqrt(a^2+(z(i)-zp(j))^2);
       g(i,j)=exp(-sqrt(-1)*k*range(i,j))/(4*pi*range(i,j));
    end
end
for i=1:201
    z(i)=delz*(i-1)-l/2;
    rhs1(i)=-(sqrt(-1)/377)*sin(k*abs(z(i)));
    rhs2(i)=-(sqrt(-1)/377)*cos(k*z(i));
end
C1=inv(g)*rhs1.';
C2=inv(g)*rhs2.';
B=-C1(201)/C2(201);
rhs=rhs1+B*rhs2;
curr=inv(g)*rhs.';
plot(z,abs(curr));
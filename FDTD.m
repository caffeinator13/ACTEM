%%FDTD Example

close all;
clear all;
clc;
ke = 3000; % Size of the FDTD space
ks = 1; % Position of the source
n = 1000; % Number of time steps
to = 1.e-9;
% Cell size and time stepping
c=3.e8;
dt = 1.e-12;
dz = 1./(c.*dt);
%circuit params
R = 100; %R = 100 ?m?1
L = 80.e-9; %L = 80 nH·m?1
G = 1.6; %G = 1.6 S·m?1
C = 200.e-12; %C = 200 pF·m?1
%constants
c1 = -2.*dt./(2.*L.*dz + dt.*R.*dz);
c2 = (2.*L-dt.*R)./(2.*L+dt.*R);
c3 = -2.*dt./(2.*C.*dz + dt.*G.*dz);
c4 = (2.*C-dt.*G)./(2.*C+dt.*G);
% Initialize vectors
i=zeros(1,ke);
v=zeros(1,ke);

%for t=1:n/3
%    v(t) = 1;
 %   i(t) = 0;
%end

for t=1:n
% i(z,t) loop
for k=2:ke-1;
i(k)=c2*i(k)+c1*(-v(k-1)+v(k));
end
% Source
i(ks) = square(t);
% v(z,t) loop
for k=1:ke-1
v(k)=c4*v(k)+c3*(-i(k)+i(k+1));
end
plot(i);
axis([-ke ke -2 2]);
M(:,t) = getframe ;
% input('')
end
movie(M,1);
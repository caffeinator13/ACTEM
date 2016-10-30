delz=.33*10^-3;   
delt=delz/(3*10^8);
l=3000*delz;
L=50/(3*10^8);
C=L/50^2;
C1=-delt/(delz*L);
C2=1;
C3=-delt/(delz*C);
C4=1;
V(1)=1;
I(1)=1/50;
for i=2:2999
    V(i)=0;
    I(i)=0;
end
V(3000)=0;
I(3000)=I(2999);
 for iter=1:30
     for i=2:2999
         II(i)= C1*(V(i)-V(i-1))+C2*I(i);
         VV(i)= C3*(I(i)-I(i-1))+C4*V(i);
    end
    for i=2:2999
        I(i)= II(i);
        V(i)= VV(i);
    end
    I(3000)=I(2999)
 end
 plot (V)

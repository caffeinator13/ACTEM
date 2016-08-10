%% ref: Microwave_Engineering_David_M_Pozar_4ed_Wiley_2012 %%

%clc; clear all; close all;
e = 8.854*(10^-(12));
er = 1;                %value of espilon
%a = @(b) 100*b           % b/a = 100
c = 3*(10^8);              %speed of light

%% calculationg impedance from (3.179a) %%
%Z = (30*pi)./sqrt(e).*(i + 0.441)
j = [0.25,0.5,1,2,5];
valueOfZ = zeros(1,5);
for  i=1:length(j)   % i = w/b
   Z = (30*pi)./(sqrt(er).*(j(i) + 0.441))
   valueOfZ(i) = Z;
end

%% calculating impedance from (3.192): An Approximate Electrostatic Solution %%

syms n i  %creating symbolic varialbles(no value)
k=1:2:1000;
fdenom=0;
Cdenom = @(n,i) ((sin(n.*pi.*i./200))/(((n.*pi).^2).*e.*er.*(cosh(n.*pi./200))))*(200./(n.*pi.*i))*(sin(n.*pi.*i./200))*sinh(n*pi./200);

for k=1:2:500;               %summation truncated to 500
        A=symsum(Cdenom,n,k,k+1);
        fdenom=fdenom+A;
end
   C = @(i) 0.01.*i/fdenom;
   
for i = [0.125./2,0.25,0.5,1,2,5]     % i = w/b
   imp =  @(i) sqrt(er)./ (c.*C(i));
   subs(C(i))
   subs(imp(i))
end

        


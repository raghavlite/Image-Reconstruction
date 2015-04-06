


t = 0 : 0.000001 : 0.01-0.000001;

kl=zeros(1,10000);

for i = 1:10000

if (ceil(mod(floor(t(i)/0.0005),2)) == 0)
kl(i)=0;
disp(i);
else
kl(i)=1;
disp(i);
end  


end




f1=1000;
f2=10000;% frequency of the burst sine wave


SN1 = sin(2*pi*f1*t); 
SN2 = sin(2*pi*f2*t);

% SQ = square(t,30);


FL = SN1.*(SN2.*kl);


plot(t,FL);








































TON = 0.00000033;

TF=0.0000005;

TS=0.000000005;

t  = 0:TS:(2*TF-TS);

kl = zeros(1,round((2*TF)/TS));

for i = 1:round((2*TF)/TS)

if (i-floor(t(i)/TF)*(TF/TS) <= TON/TS)
kl(i)=1;
% disp(i);
else
kl(i)=0;
% disp(i);
end  


end



A=58500000;
B=61500000;


A1 =sin(2*pi*A*t);

B1=cos(2*pi*B*(t.*t));

C1=cos(2*pi*A*t);

D1=sin(2*pi*B*(t.*t));

FL = (A1.*B1)+(C1.*D1);

plot(t,FL.*kl);

































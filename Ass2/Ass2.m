

% X : data
% fs : Sampling rate
% N :  number of bits per sample

[X, fs] = wavread('dtmf_sound.wav');



% 
% 
figure;
plot(X);
title('DTMF signal');
xlabel('Time');
ylabel('Amplitude');


l = size(X,1);
R = rms(X);

x = input('Continue 1/0 :');

if(x==1)
close all;

else
    
close all;
return;
end


disp('Highlighting the desirable part ......');

LE = zeros(l,1);


for i= 31:l-30
    
    if(rms(X(i-30:i+30,1))<.6*R)
    
        
        
    else
        LE(i)=1;
        
    end
    
    
    
    
end

for i = 1:30

if(rms(X(i:i+40))<.6*R)    
else
    LE(i)=1;
end




end

for i = l-29:l

if(rms(X(i:i-40))<.6*R)    
else
    LE(i)=1;
end




end


harea = area(1:l, LE, 'LineStyle', 'none');
    set(harea, 'FaceColor', 'y')
    hold on;
    
harea = area(1:l, -LE, 'LineStyle', 'none');
    set(harea, 'FaceColor', 'y')
     hold on;


plot(X);
title('DTMF signal');
xlabel('Time');
ylabel('Amplitude');


























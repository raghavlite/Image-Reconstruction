function [ otpt ] = Local_E( X,R )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if(rms(X)>R)
    otpt=0;
else
    otpt=1;
end




end


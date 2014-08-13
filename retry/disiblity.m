function [ z_div ] = disiblity( dp )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


for j3=1:1:max(size(dp))
    for j4=1:1:max(size(dp))
        for k=1:1:9;
             t(k) = mod(dp(j3,j4),(k+1));
             if t(k) == 0
                z_div(1,k)=98;   
              end
        end
    end
end


end


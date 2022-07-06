function speed = calSpeed(py,px,diff)

    % px and py is gradient of phase towards x and y axis
    % diff is derivative of the phase in time
    
    distanceElecs = 400*10^-6; % electrode distances - in m
    Fs = 200; %  sampling rate
    
    % numerator of the speed
    speedNum = abs(mean(diff(~isnan(diff))*Fs));
 
    % denominator of the speed  
    grad2 = sqrt((px/distanceElecs).^2 + (py/distanceElecs).^2);
    speedDenom = mean(mean(grad2(~isnan(grad2))));

    speed = speedNum/speedDenom*100; % change the speed to cm/s
end
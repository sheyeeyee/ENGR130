% Nikhil Misra, Edward Liu, Shelley Wei, Cindy Ning
% ENGR 130 Module 6 Report
% Section B
% November 16th, 2023

clear;
clc;
close all;

% loading the external file
load('M5_MEASURED_RPM.mat')

% graphing RPM vs time
plot(time, RPM)
grid on

% creating a straight line at y = 1000 to see if the graph ever reaches
% 1000 RPM
yline(1000)

% using the function to find the final RPM value, maximum overshoot
% percentage, rise time, and settling time of the wave
[steadyvalue, maximum, rising, settling] = getWaveformData(RPM, time);

%% LAB 2 P
clear;
clc;
close all;

% creating five plots that test five different values of P
figure(1)

subplot(5, 1, 1)
[trial_time1, trial_RPM1] = control_system('P', 1);
plot(trial_time1, trial_RPM1)
yline(1000)
[finalr1, maxover1, riset1, settlet1] = getWaveformData(trial_RPM1, trial_time1);
title('Graph for a P Value of 1')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 2)
[trial_time2, trial_RPM2] = control_system('P', 55);
plot(trial_time2, trial_RPM2)
yline(1000)
[finalr2, maxover2, riset2, settlet2] = getWaveformData(trial_RPM2, trial_time2);
title('Graph for a P Value of 55')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 3)
[trial_time3, trial_RPM3] = control_system('P', 70);
plot(trial_time3, trial_RPM3)
yline(1000)
[finalr3, maxover3, riset3, settlet3] = getWaveformData(trial_RPM3, trial_time3);
title('Graph for a P Value of 70')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 4)
[trial_time4, trial_RPM4] = control_system('P', 90);
plot(trial_time4, trial_RPM4)
yline(1000)
[finalr4, maxover4, riset4, settlet4] = getWaveformData(trial_RPM4, trial_time4);
title('Graph for a P Value of 90')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 5)
[trial_time5, trial_RPM5] = control_system('P', 100);
plot(trial_time5, trial_RPM5)
yline(1000)
[finalr5, maxover5, riset5, settlet5] = getWaveformData(trial_RPM5, trial_time5);
title('Graph for a P Value of 100')
xlabel('Time (s)')
ylabel('RPM')

%% LAB 2 PD
clear;
clc;
close all;

% creating five plots that test five different values of D while keeping P
% 100 because when P was 100, the final RPM was closest to the target value
figure(1)

subplot(5, 1, 1)
[trial_time1, trial_RPM1] = control_system('P', 100, 'D', 2);
plot(trial_time1, trial_RPM1)
yline(1000)
[finalr1, maxover1, riset1, settlet1] = getWaveformData(trial_RPM1, trial_time1);
title('Graph for a D Value of 2')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 2)
[trial_time2, trial_RPM2] = control_system('P', 100, 'D', 14);
plot(trial_time2, trial_RPM2)
yline(1000)
[finalr2, maxover2, riset2, settlet2] = getWaveformData(trial_RPM2, trial_time2);
title('Graph for a D Value of 14')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 3)
[trial_time3, trial_RPM3] = control_system('P', 100, 'D', 16);
plot(trial_time3, trial_RPM3)
yline(1000)
[finalr3, maxover3, riset3, settlet3] = getWaveformData(trial_RPM3, trial_time3);
title('Graph for a D Value of 16')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 4)
[trial_time4, trial_RPM4] = control_system('P', 100, 'D', 18);
plot(trial_time4, trial_RPM4)
yline(1000)
[finalr4, maxover4, riset4, settlet4] = getWaveformData(trial_RPM4, trial_time4);
title('Graph for a D Value of 18')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 5)
[trial_time5, trial_RPM5] = control_system('P', 100, 'D', 20);
plot(trial_time5, trial_RPM5)
yline(1000)
[finalr5, maxover5, riset5, settlet5] = getWaveformData(trial_RPM5, trial_time5);
title('Graph for a D Value of 20')
xlabel('Time (s)')
ylabel('RPM')

%% LAB 3 PID
clear;
clc;
close all;

% creating five plots that test five different values of I while keeping P
% 100 and D 20 because when D was 20, the maximum overshoot was smallest
figure(1)

subplot(5, 1, 1)
[trial_time1, trial_RPM1] = control_system('P', 100, 'I', 2, 'D', 20);
plot(trial_time1, trial_RPM1)
yline(1000)
[finalr1, maxover1, riset1, settlet1] = getWaveformData(trial_RPM1, trial_time1);
title('Graph for a I Value of 2')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 2)
[trial_time2, trial_RPM2] = control_system('P', 100, 'I', 14, 'D', 20);
plot(trial_time2, trial_RPM2)
yline(1000)
[finalr2, maxover2, riset2, settlet2] = getWaveformData(trial_RPM2, trial_time2);
title('Graph for a I Value of 14')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 3)
[trial_time3, trial_RPM3] = control_system('P', 100, 'I', 16, 'D', 20);
plot(trial_time3, trial_RPM3)
yline(1000)
[finalr3, maxover3, riset3, settlet3] = getWaveformData(trial_RPM3, trial_time3);
title('Graph for a I Value of 16')
xlabel('Time (s)')
ylabel('RPM')

subplot(5, 1, 4)
[trial_time4, trial_RPM4] = control_system('P', 100, 'I', 18, 'D', 20);
plot(trial_time4, trial_RPM4)
yline(1000)
[finalr4, maxover4, riset4, settlet4] = getWaveformData(trial_RPM4, trial_time4);
title('Graph for a I Value of 18')
xlabel('Time (s)')
ylabel('RPM')

% this graph has the best values of P, I, and D
subplot(5, 1, 5)
[trial_time5, trial_RPM5] = control_system('P', 100, 'I', 20, 'D', 20);
plot(trial_time5, trial_RPM5)
yline(1000)
[finalr5, maxover5, riset5, settlet5] = getWaveformData(trial_RPM5, trial_time5);
title('Graph for a I Value of 20')
xlabel('Time (s)')
ylabel('RPM')

%% Function
function [finalr, maxover, riset, settlet] = getWaveformData(r, t)
% Purpose: this function takes the RPM and time of a wave and finds the 
% final RPM value, maximum overshoot percentage, rise time, and settling 
% time of the wave
% Function call: getWaveformData(r, t)
% Input: r is the RPM values of the wave, and t is the corresponding time
% for the RPM values
% Output: finalr is the final RPM value, maxover is the maximum
% overshoot percentage, riset is the rise time, and settlet is the settling
% time of the wave
finalr = mean(r(end-10, end));
maxover = ((max(r) - finalr) / finalr) .* 100;
ten = 0.1 * finalr;
ninety = 0.9 * finalr;
index = t(r >= ten & r <= ninety);
riset = max(index) - min(index);
count = 1;
for idx = 1:length(r)
    if abs(finalr - r(idx))/finalr >= 0.05
        count = 0;
    else
        count = count + 1;
    end 
end
settleindex = length(r) - count;
settlet = t(settleindex);
fprintf('The final RPM is %.4f, the maximum overshoot is %.4f%%, the rise time is %.4f, and the settling time is %.4f.\n', finalr, maxover, riset, settlet)
end

function [new_time, new_RPM] = control_system(varargin)
%CONTROL_SYSTEM simulates either manual or PID control of a DC Motor
%
% Syntax:
%   [new_time, new_RPM] = control_system('P', Kp)
%   [new_time, new_RPM] = control_system('P', Kp, 'D', Kd)
%   [new_time, new_RPM] = control_system('P', Kp, 'I', Ki, 'D', Kd)
%
% Inputs:
%    'P' - Callout the fact that the next input is proportional gain value
%    Kp - The value of proportional gain
%    'I' - Callout the fact that the next input is integral gain value
%    Ki - The value of integral gain
%    'D' - Callout the fact that the next input is derivative gain value
%    Kd - The value of derivative gain
%
% Outputs:
%    new_time - The resulting x-axis of time values in a vector from simulation
%    new_RPM - The resulting y-axis values of simulated RPM control in a vector from simulation
%
% Example:
%   Simulate the Proportional Gain at 50
%   [t, y] = control_system('P', 50)
%   Simulate a PD Control with values of 20 and 5
%   [t, y] = control_system('P', 20, 'D', 5)

% April 2020; Last revision: 10-November-2020
%
%------------- BEGIN CODE --------------

Kp = 0;
Ki = 0;
Kd = 0;

switch nargin
    case 2
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
    case 4
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{3}
            case 'P'
                Kp = varargin{4};
            case 'I'
                Ki = varargin{4};
            case 'D'
                Kd = varargin{4};
            otherwise
                warning("This is not a valid character!")
        end
        
        case 6
        switch varargin{1}
            case 'P'
                Kp = varargin{2};
            case 'I'
                Ki = varargin{2};
            case 'D'
                Kd = varargin{2};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{3}
            case 'P'
                Kp = varargin{4};
            case 'I'
                Ki = varargin{4};
            case 'D'
                Kd = varargin{4};
            otherwise
                warning("This is not a valid character!")
        end
        
        switch varargin{5}
            case 'P'
                Kp = varargin{6};
            case 'I'
                Ki = varargin{6};
            case 'D'
                Kd = varargin{6};
            otherwise
                warning("This is not a valid character!")
        end
        
    otherwise
        warning("Invalid amounts of arguments! Check format of function.")
end

if Kp <= 100 && Kd <= 20 && Ki <= 20
    
    s = tf('s');
    P = 1/(1*s^2 + 1.125*s + 1);
    C = pid(Kp, Ki, Kd);
    T = feedback(P*C,1);
    
    [y, t] = step(T,20);
    new_time = t;
    new_RPM = y*1000;
else
    new_time = -1;
    new_RPM = -1;
    warning("The controller cannot use one of your values! It is too high!")
end

end
% Nikhil Misra, Edward Liu, Shelley Wei, Cindy Ning
% ENGR 130 Module 6 Report
% Section B
% 11/30/23

%% LAB 3
% 5) Analyze your manual control of puck height
clear; clc; close all;

% read in the data from the oscilloscope
data = readmatrix("SectionB_Group11_M6_L3.csv");

% organize the data into time and voltage vectors without the NaN data
time = data(6:end, 1);
voltages = data(6:end, 2);

% find the supposed distances (cm) between the puck and the fan by using the function based on voltage and put it into a distance vector
distance = readSensor(voltages);

% use function from Lab 1 to calculate final value (cm), max overshoot (%), rise time (s), and settle time (s)
[finalVal, maxOver, riseTime, settleTime] = getWaveformData(distance, time);

%% Functions
% LAB 3
function cm = readSensor(voltage)
    % Takes in a sensor reading in volts and returns the corresponding distance of the puck from the fan in centimeters
    % Call format: readSensor(voltage)
    % Input
    %   voltage: the voltage reading from the sensor at the top of the tube on the fan
    % Output
    %   cm: the distance the puck is from the fan in centimeters

    % use data from our manual control run to create a function that will convert voltage to distance (cm)
    dist = [15.6, 7, 13.2, 10.8];
    volt = [2.1, 0.8, 1.67, 1.25];

    coeff = polyfit(volt, dist, 1); % find the coefficients of the linear equation
    cm = polyval(coeff, voltage); % use the coefficients of the linear equation and plug in voltage to calculate the respective distances
end

% Function from Lab 1
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
        if abs(finalr - r(idx))/finalr >= 0.05 % 0.3
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
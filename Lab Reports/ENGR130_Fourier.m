function [f, Y] = ENGR130_Fourier(t, signal)
    % ENGR130_Fourier uses Matlab's fft() function together with additional
    % post-processing steps to convert from time to frequency domain for an
    % input signal.
    %
    % Syntax:
    %   [f, Y] = ENGR130_Fourier(t, signal) 
    %
    % Inputs:
    %    t      - A time vector with uniform stepsize (likely generated by MATLAB
    %             or collected by the oscilloscope
    %    signal - The corresponding voltage values for each point in t.
    %             This array must be the same size as t_in.
    %
    % Outputs:
    %    f     - A frequency vector corresponding to the fft of signal
    %    Y     - The amplitude contributions at each frequency f.
    %
    % Example Usage:
    %   [frequency, Amplitude] = ENGR130_Fourier(time, Voltage_collected)
    
    % Nov 2020; Last revision: Rhoads 10-28-2022
    %
    %------------- BEGIN CODE --------------
    
    % Change column vectors to row vectors
    [rows, ~] = size(signal);
    if rows > 1
        signal = signal';
        t = t';
    end
    
    % Look for poor importing (Titles, names, not numbers...)
    t_new = t(~isnan(t));
    
    shift = length(t) - length(t_new);
    t = t_new - min(t_new);
    signal = signal(1:end - shift);
    
    % define dt for given time step
    dt = t(2) - t(1);
    
    % create time vector for given time
    xq = 0:dt:max(t);
    
    % Have to get unique points out of the way,
    %    although there should be none.
    [time_u, index] = unique(t); 
    vq = interp1(time_u, signal(index), xq);
    
    % If the data doesn't start right away, there are issues
    % Specifically, NaN shows up and clutters the DC Offset
    signal = vq(~isnan(vq));
    
    % Starting to do the Fourier transform
    N = length(signal);
    
    % define sampling frequency, Hz
    fs = 1/dt;
    
    % We need an even number of samples, so just chop off the excess
    if rem(N, 2) ~= 0
        signal = signal(1:end-1);
    end
    
    % total number of samples
    N = length(signal);
    
    % discrete Fourier transform
    Y = fft(signal);
    
    % create the frequency variable
    f = fs/N * (0:N/2);
    
    % shorten DFT to only half of the values (positive Frequencies)
    Y = Y(1:N/2+1);
    
    % Normalize the Fourier transform, take absolute magnitude
    Y = abs(Y)/N;
    
    % correct normalization b/c only using half the frequncies.
    Y(2:end) = 2 * Y(2:end);
end

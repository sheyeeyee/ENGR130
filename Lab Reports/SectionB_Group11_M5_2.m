% Shelley Wei, Cindy Ning, Nikhil Misra, Edward Liu
% ENGR 130
% Module 5, Group 11
% Started 11/7/23
% Finished 11/7/23
% Due 11/13/23

%% LAB 3
% 2. Collect and process data from the oscilloscope
clear; clc; close all;

heartbeat = readmatrix("M5_Heartbeat.csv");

time = heartbeat(3:end, 1);
voltage = heartbeat(3:end, 2);

[f1, y1] = ENGR130_Fourier(time, voltage);

% remove the first data point from the vectors (frequency of 0, peak voltage)
f1 = f1(2:end);
y1 = y1(2:end);

stem(f1, y1);
xlim([0,2]);
xlabel("Frequency");
ylabel("Amplitude");
title("Heartbeat");

% 3. Analyze the signal in the frequency domain
freq = getComponentParams(f1, y1, 0.2);

% sanity check
% freqMajor = getComposite(freq(:, 1), freq(:, 2), time);
% plot(time, freqMajor);

fprintf("The heartrate is %.2f beats per minute.\n", freq(1, 1)*60);

%% LAB 4

clear; clc; close all;

vector_norm = readmatrix("ECG_norm.csv");
vector_1 = readmatrix("ECG1.csv");
vector_2 = readmatrix("ECG2.csv");
vector_3 = readmatrix("ECG3.csv");
vector_4 = readmatrix("ECG4.csv");
vector_5 = readmatrix("ECG5.csv");

vector_norm =vector_norm';
vector_1 =vector_1';
vector_2 =vector_2';
vector_3 =vector_3';
vector_4 =vector_4';
vector_5 =vector_5';

norm_peak(1)=0;
o=1;
for i=2:length(vector_3(2,:))-1
    if(vector_norm(2,i-1)<vector_norm(2,i) & vector_norm(2,i)>vector_norm(2,i+1) & vector_norm(2,i) > 4000)
        norm_peak(o)=i;
        o=o+1;
    end
end

one_peak(1)=0;
o=1;
for i=2:length(vector_1(2,:))-1
    if(vector_1(2,i-1)<vector_1(2,i) & vector_1(2,i)>vector_1(2,i+1) & vector_1(2,i) > 4000)
        one_peak(o)=i;
        o=o+1;
    end
end


two_peaks(1)=0;
o=1;
for i=2:length(vector_2(2,:))-1
    if(vector_2(2,i-1)<vector_2(2,i) & vector_2(2,i)>vector_2(2,i+1) & vector_2(2,i) > 4000)
        two_peaks(o)=i;
        o=o+1;
    end
end


three_peaks(1) = 0;
o = 1;
for i = 2:length(vector_3(2,:))-1
    if(vector_3(2,i-1) < vector_3(2,i) & vector_3(2,i) > vector_3(2,i+1) & vector_3(2,i) > 4000)
        three_peaks(o)=i;
        o=o+1;
    end
end

four_peaks(1) = 0;
o = 1;
for i = 2:length(vector_4(2,:))-1
    if(vector_4(2,i-1) < vector_4(2,i) & vector_4(2,i) > vector_4(2,i+1) & vector_4(2,i) > 4000)
        four_peaks(o)=i;
        o = o + 1;
    end
end

five_peaks(1) = 0;
o = 1;
for i = 2:length(vector_5(2,:))-1
    if (vector_5(2,i-1)<vector_5(2,i) & vector_5(2,i)>vector_5(2,i+1) & vector_5(2,i) > 4000)
        five_peaks(o)=i;
        o=o+1;
    end
end


heartbeat_norm = 60/((vector_norm(1,norm_peak(length(norm_peak)))-vector_norm(1,norm_peak(1)))/length(norm_peak));
heartbeat_1 = 60/((vector_1(1,one_peak(length(one_peak)))-vector_1(1,one_peak(1)))/length(one_peak));
heartbeat_2 = 60/((vector_2(1,two_peaks(length(two_peaks)))-vector_2(1,two_peaks(1)))/length(two_peaks));
heartbeat_3 = 60/((vector_3(1,three_peaks(length(three_peaks)))-vector_3(1,three_peaks(1)))/length(three_peaks));
heartbeat_4 = 60/((vector_4(1, four_peaks(length(four_peaks)))-vector_4(1,four_peaks(1)))/length(four_peaks));
heartbeat_5 = 60/((vector_5(1,five_peaks(length(five_peaks)))-vector_5(1,five_peaks(1)))/length(five_peaks));

heartbeats = [heartbeat_1, heartbeat_2, heartbeat_3, heartbeat_4, heartbeat_5];

a = arduino();
buzzPin = 'D8';

% frequencies for notes
cNote = 2093;
ebNote = 2489.02;
gNote = 3135.96;
bbNote = 3729.31;

for i = 1:length(heartbeats)
   if (heartbeats(i) < 60 )
       playTone(a, buzzPin, cNote, 1); % play C
       pause(1);
       playTone(a, buzzPin, cNote, 0); % play C
       pause(1);
   elseif (heartbeats(i) > 100)
       playTone(a, buzzPin, ebNote, 1); % play E flat
       pause(1);
       playTone(a, buzzPin, ebNote, 0); % play E flat
       pause(1);
   % elseif (2)
   %     playTone(a, buzzPin, gNote, 1); % play G
   %     pause(0.1);
   %     playTone(a, buzzPin, gNote, 0); % play G
   %     pause(0.1);
   % else
   %     playTone(a, buzzPin, bbNote, 1); % play B flat
   %     pause(0.1);
   %     playTone(a, buzzPin, bbNote, 0); % play B flat
   %     pause(0.1);
   end
end

%% Functions
function  y = getSinusoid(f,A,t)
    % This function generates the y-value of a given sine function & time domain
    % Call Format: getSinusoid(f,A,t)
    % Input: 
    %    f: frequency
    %    A: amplitude
    %    t: time vector
    % Output: 
    %    y: the y-values of the sinusoid
    y = A*sin(2*pi*f.*t);
end

function composite = getComposite(f, A, t)
    % Generates the y-value for a given composite (sum of sine functions)
    % Call Format: getComposite(f,A,t)
    % Inputs
    %    f: frequency vector
    %    A: amplitude vector
    %    t: time vector
    % Output
    %    composite: the y-values of the composite

    % throw an error if the frequency and amplitude vectors are different
    % lengths since they then can't be analyzed together as there is
    % probably missing data
    if (length(f) ~= length(A))
        error("The length of the frequency and amplitude vector is different");
    end
          
    composite = 0; % initialize composite vector of different sin functions

    for i = 1:length(f)
       composite = composite + getSinusoid(f(i), A(i), t); % add sin functions to the composite vector
    end
end

function m = getComponentParams(f, Y, thresh)
    % This function return a 2-column matrix where the first column contains the 
    % major frequencies and the second column contains the corresponding amplitudes
    % Call format: getComponentParams(frequcency, amplitude, threshold)
    % Inputs
    %   f: the frequency vector for the signal
    %   Y: the amplitude vector for the signal, thresh=threshold for the amplitude
    % Output
    %   m: a 2-column matrix where the first column contains the major frequencies and the second column contains the corresponding amplitudes
    m = [f(Y>thresh); Y(Y>thresh)]'; % use logical indexing to find the corresponding indices where the amplitude is greater than the threshold for the frequency and amplitude vectors
end

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
    
    % correct normalization b/c only using half the freqeuncies.
    Y(2:end) = 2 * Y(2:end);
end
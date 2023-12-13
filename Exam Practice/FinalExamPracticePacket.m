%% #
clear; clc; close all;

a = 1:20
b = linspace(20, 1, 20)
c = a ./ b 
e = 1:length(c)

for d = 1:length(b)
    e(d) = e(d) * 5; 
end

figure(1) 
plot(b, a) 
figure(2) 
plot(c, a) 
figure(3) 
plot(d, a) 
figure(4) 
plot(e, a) 
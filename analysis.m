
clear all; close all; clc; format compact
 
% Define parameters of circuit
R = 100e3     % Update according to resistor used in circuit
C = 10e-6
 
tau = R*C
 
% Load in data
 
% OPTION 1: If loading file from your local machine:
% A = csvread('data.csv',2,1);
 
% OPTION 2: If using MATLAB via Virtual Computing Lab, identify folder on your laptop:
A = csvread('\\client\C$\Users\Steve\Desktop\Stevo\UMCP\ENME351\Labs\05-1st_order_systems\Demo_v1\data.csv',2,1);
 
% Extract and assign data
Vin = A(:,1);
Vc = A(:,2);
 
% Create index of time array
t = []
t(1) = tau/50;
 
for i = 2:length(Vin)
    t(i) = t(i-1) + tau/50;    
end
 
% Plot data
figure(1);hold on
plot(t,Vin,'b','LineWidth',4)
plot(t,Vc,'r','LineWidth',4)
title('Title here');
grid minor
legend('V_i_n','V_C','Location','NorthEast')
title('Analysis of RC Circuit Data')
xlabel('Time [sec]')
ylabel('ADC Code')

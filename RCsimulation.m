clear all; close all; clc; format compact
  
% RC circuit specifications
V_in = 5
R = [10e3, 100e3]
C = 10e-6
tau = R*C
 
% Define length of time to run simulation
t = [0:0.1:10];
 
% Simulate RC circuit and plot results
for i = 1:length(R)
    for j = 1:length(t)
        V_C(i,j) = V_in - V_in*exp(-t(j)/(R(i)*C));
    end
        figure(1); hold on
        plot(t,V_C(i,:),'LineWidth',4)
end
 
% Plot 5V input on top of simulation results
legend('10 k\Omega','100 k\Omega','Location','SouthEast')
plot([-10 0],[0 0],'r-',[0 0],[0 5],'r',[0 10],[5 5],'r')    
title('RC Circuit Time Response')
xlabel('Time [sec]')
ylabel('Voltage [V]')
axis([min(t)-1 max(t)+0.25 -0.25 5.5])
grid minor

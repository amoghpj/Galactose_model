%%
% This solves an ODE model with one parameters set and plots the variables
% versus time.
% 
% 20160204 Jue

% clear workspace variables and close plots
clear all
close all

% set parameters
setup_params_Venturelli2015_1 % initializes params_model1_qss

% solve ODE
trange = [0 40];
x0 = [0 0 0 0]; % G1, R, G80, G4
[t,x] = ode45(@(t,x) EqnsVenturelli2015_1qss(t,x,params_model1_qss), trange, x0);

% plot time-traces
figure
plot(t,x,'-');
hold all
legend('GAL1','Repressor','GAL80','GAL4');
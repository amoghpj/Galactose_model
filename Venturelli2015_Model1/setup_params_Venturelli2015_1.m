%%
% This sets parameters for the Venturelli S1.1 model using values from
% Table S1.
%
% 20160204 Jue

% parameters from Venturelli 2015 Table S1
k_fg =  70.3;
k_rg =  3391;
k_fR =  56.2;
k_rR =  3564;
k_f81 = 41.1;
k_r81 =	700.1;
k_f84 =	95.2;
k_r84 =	1237;
alpha_0G1 =	0.93;
alpha_G1 =	16.5;
alpha_G4 =	2;
alpha_0G80 =	0.71;
alpha_G80 =	2;
alpha_R =	0.75;
K_G1 =	41.6;
K_R1 =	67.4;
K_R4 =	33.8;
K_G80 =	14;
n_1 =	3;
n_R1 =	2;
n_R4 =	1;
n_80 =	2;
gamma_G1 =	0.005;
gamma_G1s =	0.0087;
gamma_G4 =	0.004;
gamma_G80 =	0.005;
gamma_R =	0.009;
gamma_Rs =	0.009;
gamma_C81 =	0.015;
gamma_C84 =	0.024;
alpha_G80s =	2.5;

% aggregated parameters for quasi-steady-state equations
p0 = k_f81/(gamma_C81+k_r81);
p1 = k_f84/(gamma_C84+k_r84);
p2 = glu*k_fR/(gamma_Rs+k_rR);
p3 = k_fg*gal;
p4 = gamma_G1s + k_rg;
p5 = k_f81 - k_r81*p0;
p6 = k_f81*p3 + k_r81*p0*p3;
p7 = p1*k_r84 - k_f84;
p8 = p1*k_r84 - k_f84;

% package up parameters for inputting to ODEs
params_model1_qss = v2struct(alpha_0G1, alpha_G1, alpha_R, ...
    alpha_0G80, alpha_G80, alpha_G4,...
    gamma_G1, gamma_R, gamma_G80, gamma_G4,...
    k_fg, k_rg, k_fR, k_rR,...
    K_R1, K_G1, K_R4,...
    p0, p1, p2, p3, p4, p5, p6, p7, p8,...
    n_1, n_R1, n_R4, n_80, glu, gal);

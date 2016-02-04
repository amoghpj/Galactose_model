function dx = EqnsVenturelli2015_1qss(t, x, params)
% EqnsVenturelli2015_1qss computes derivatives using the model in S1.1 of
% Venturelli 2015 PLoS Biology assuming that protein complexes are at
% quasi-steady-state.
%
% 20160204 Jue

% unpack parameters
v2struct(params);

% unpack variables
G1 = x(1);
R = x(2);
G80 = x(3);
G4 = x(4);

% compute derivatives (see Venturelli 2015 S1.1)
ddt_G1 = alpha_0G1 - gamma_G1*G1 - k_fg*G1*gal + (G1*k_rg*p3)/(p4+p5*G80) + ...
    alpha_G1*K_R1^n_R1*G4^n_1/((K_R1^n_R1+R^n_R1*p2^n_R1)*(K_G1^n_1+G4^n_1));
ddt_R = alpha_R - gamma_R*R - k_fR*glu*R + k_rR*p2*R;
ddt_G80 = alpha_0G80 - gamma_G80*G80 - p6*G1*G80/(p4+p5*G80) + p7*G80*G4 + ...
    alpha_G80*G4^n_80/(K_R4^n_80+G4^n_80);
ddt_G4 = alpha_G4*K_R4^n_R4/(K_R4^n_R4+p2^n_R4*R^n_R4) - gamma_G4*G4 + p8*G80*G4;

% pack and output derivatives (in same order as variables in x)
dx = [ddt_G1; ddt_R; ddt_G80; ddt_G4];
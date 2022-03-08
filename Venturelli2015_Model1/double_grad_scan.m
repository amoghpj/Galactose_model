% scan glucose and galactose concentrations and measure gal4

% clear workspace variables and close plots
% clear all
% some new changes
close all

% set up the function handle to solve ODE
% ode_handle = @(varargin) ode45(varargin{:});
ode_handle = @(varargin) ode15s(varargin{:});  % for stiff problems

% env
glu_init_glucose_history = 10;
gal_init_galactose_history = 0;

% parameters to scan
glu_array = [0, 2.^[0:10]];
gal_array = [0, 2.^[0:3]];
n_glu = length(glu_array);
n_gal = length(gal_array);

% GAL4 end concentrations
G4_end_array = nan(n_glu, n_gal);

% scan parameters
for i_glu = 1:n_glu
    for i_gal = 1:n_gal
        
        % environment
        glu = glu_init_glucose_history;
        gal = gal_init_galactose_history;
        
        % set parameters
        setup_params_Venturelli2015_1 % initializes params_model1_qss
        
        % set up initial condition
        trange = [0 1000];
        x0 = [0 0 0 0]; % G1, R, G80, G4
        [t,x] = ode_handle(@(t,x) EqnsVenturelli2015_1qss(t,x,params_model1_qss), trange, x0);
        x0 = x(end, :);
        
        % environment
        glu = glu_array(i_glu);
        gal = gal_array(i_gal);
        
        % set parameters
        setup_params_Venturelli2015_1 % initializes params_model1_qss
        
        % solve ODE
        trange = [0 1000];
        [t,x] = ode_handle(@(t,x) EqnsVenturelli2015_1qss(t,x,params_model1_qss), trange, x0);
        G4_end = x(end, 4);
        
        G4_end_array(i_glu, i_gal) = G4_end;
                
    end
end

G4_end_array_glu_history = G4_end_array;

%% plot
figure
surf(G4_end_array')
set(gca, 'xtick', 1:n_glu, 'xticklabel', glu_array)
set(gca, 'ytick', 1:n_gal, 'yticklabel', gal_array)
xlabel('Gluc conc.'), ylabel('Galc conc.'), zlabel('Gal4 level at t = 1000');
view([36, 62])
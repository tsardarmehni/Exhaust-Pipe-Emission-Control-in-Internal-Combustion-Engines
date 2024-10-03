clear 
clc
global W1 W2 b1 b2 U_1 min_lambda max_lambda 

%% engine parameters

alfa0=15*pi/180;  % Throttle plate closing angle
Pa=1.013;         % ambient pressure in bar
Vi=3*564e-6;      % intake manifold and port passage volume m^3
R=0.00287;        % gas global constant kj kg/k
Ta=293;           % ambient temperture k
Ti=308;           % intake manifold temperature k
mat1=5.9403;      % a parameter in finding m_at
mpTa=mat1*Pa/sqrt(Ta); % a parameter in finding m_at
mat0=0;           % a parameter in finding m_at
Vd=1.275;         % engine displacement liter
Ncyl=4;           % number of cylinders 
k=1.4; % 
Pc=.4125;         % a parameter (2/(k+1))^(k/(k-1));
si=.961;          % slope in volumetric efficiency 
yi=-0.07;         % bias in volumetric efficiency 
etaif2 = -0.015;
Lth=14.67;        % Stoichiometric AFR 
Hu=43000;         % Fuel heating value for gasoline kj/kg
Iac = 0.48;       % Moment of Inertia of engine
I = Iac*(2.0*pi/60)^2*1000;
kb2 = 0.470;
eta_var=.00010000;

%% neural network weights and bias terms 

% wieghts in the hidden layer of the neural network
W1 = [0.592914800842690	1.25815955137360	1.39919905554904	3.41285598808794
        -0.00871309626170767	-0.358389916615477	-0.285366031610041	-0.712989521257612
        -0.0163304117053378	-0.465960743474944	2.34625953956319	-2.16672891438372
        2.60879293016287	-0.980828607062894	-2.63663985586096	-1.31930727162727];

% wieghts in the output layer of the neural network 
W2= [0.0386   -0.8893    0.6852   -0.1763];

% bias in the first layer of the neural network
b1 =[   -4.3893
        0.3245
        0.1885
        4.7925];

% bias in the output layer of the neural network
b2 = 0.3742;

%% normalization paramters 

max_lambda =  1.1062; % max value of labmda used for normalization/denormalization
min_lambda =  0.0161;  % min value of labmda used for normalization/denormalization
max_m_dot =   0.0077; % max value of dot_m_fi used for normalization/denormalization
min_m_dot =   0.0012; % min value of dot_m_fi used for normalization/denormalization

%% controller intial values

dt = 0.001;         % sample time 
U_1 = 0.0079;       % initial value to start the Gradient Descent in MPC

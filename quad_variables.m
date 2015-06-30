% Wil Selby
% Washington, DC
% May 30, 2015

% This script defines and initializes the variables for the quadrotor simulator.                                  %

global Quad;

%% Initialize Variables

% Simulation Parameters
Quad.init = 0;     % used in initilization 
Quad.Ts = .01;     % Sampling time (100 Hz)
Quad.sim_time = 5; % Simulation time (seconds)
Quad.counter = 1;                      % the counter that holds the time value

% Plotting Variables
Quad.t_plot = [0:Quad.Ts:Quad.sim_time-Quad.Ts];       % the time values
Quad.Xtemp = 0;     % Temp variables used rotating and plotting quadrotor
Quad.Ytemp = 0;     % Temp variables used rotating and plotting quadrotor
Quad.Ztemp = 0;     % Temp variables used rotating and plotting quadrotor

% Environmental Parametes
Quad.g = 9.81;     % Gravity (m/s^2)

% Quadrotor Physical Parameters
Quad.m = 1.4;      % Quadrotor mass (kg)
Quad.l = .56;     % Distance from the center of mass to the each motor (m)
Quad.t = .02;   %Thickness of the quadrotor's arms for drawing purposes (m)
Quad.rot_rad = .1;   %Radius of the propellor (m)
Quad.Kd = 1.1E-6;    % Drag torque coeffecient

Quad.Kdx = 1.1E-6;    % Translational drag force coeffecient
Quad.Kdy = 1.1E-6;    % Translational drag force coeffecient
Quad.Kdz = 1.1E-6;    % Translational drag force coeffecient

Quad.Jx = .05;     % Moment of inertia about X axis (kg-m^2)
Quad.Jy = .05;     % Moment of inertia about Y axis (kg-m^2)
Quad.Jz = .24;    % Moment of inertia about Z axis (kg-m^2)

%Translational Positions
Quad.X = 0;        % Initial position in X direction GF (m)
Quad.Y = 0;        % Initial position in Y direction GF (m)
Quad.Z = 0;        % Initial position in Z direction GF (m)
Quad.X_BF = 0;     % Initial position in X direction BF (m)
Quad.Y_BF = 0;     % Initial position in Y direction BF (m)
Quad.Z_BF = 0;     % Initial position in the Z direction BF (m)

%Translational Velocities
Quad.X_dot = 0;    % Initial velocity in X direction GF (m/s)
Quad.Y_dot = 0;    % Initial velocity in Y direction GF (m/s)
Quad.Z_dot = 0;    % Initial velocity in Z direction GF (m/s)
Quad.X_dot_BF = 0;    % Initial velocity in X direction BF (m/s)
Quad.Y_dot_BF = 0;    % Initial velocity in Y direction BF (m/s)
Quad.Z_dot_BF = 0;    % Initial velocity in Y direction BF (m/s)

%Angular Positions
Quad.phi = 0;      % Initial phi value (rotation about X GF, roll,  radians)
Quad.theta = 0;    % Initial theta value (rotation about Y GF, pitch, radians)
Quad.psi = 0;      % Initial psi value (rotation about Z GF, yaw, radians)

%Angular Velocities
Quad.p = 0;        % Initial p value (angular rate rotation about X BF, radians/s)
Quad.q = 0;        % Initial q value (angular rate rotation about Y BF, radians/s)
Quad.r = 0;        % Initial r value (angular rate rotation about Z BF, radians/s)

% Desired variables
Quad.X_des_GF = 0;         % desired value of X in Global frame
Quad.Y_des_GF = 0;         % desired value of Y in Global frame
Quad.Z_des_GF = 0;         % desired value of Z in Global frame
Quad.X_des = 0;            % desired value of X in Body frame
Quad.Y_des = 0;            % desired value of Y in Body frame
Quad.Z_des = 0;            % desired value of Z in Body frame

Quad.phi_des = 0;          % desired value of phi (radians)
Quad.theta_des = 0;    % desired value of theta (radians)
Quad.psi_des = 0;          % desired value of psi (radians)

% Control Inputs
Quad.U1 = 0;       % Total thrust (N)
Quad.U2 = 0;       % Torque about X axis BF (N-m)
Quad.U3 = 0;       % Torque about Y axis BF (N-m)
Quad.U4 = 0;       % Torque about Z axis BF (N-m)

% Motor Parameters
Quad.KT = 54.2E-6;    % Thrust force coeffecient
Quad.Jp = 104E-6;     % Moment of Intertia of the rotor (kg-m^2)
Quad.max_motor_speed = 500^2; % motors upper limit
Quad.min_motor_speed = -1*((400)^2); % motors lower limit (can't spin in reverse)

Quad.Obar = 0;     % sum of motor speeds (O1-O2+O3-O4, N-m) 
Quad.O1 = 0;       % Front motor speed (raidans/s)
Quad.O2 = 0;       % Right motor speed (raidans/s)
Quad.O3 = 0;       % Rear motor speed (raidans/s)
Quad.O4 = 0;       % Left motor speed (raidans/s)

% PID parameters
Quad.X_KP = -5*pi/180;          % KP value in X position control
Quad.X_KI = 2/1.98;            % KI value in X position control
Quad.X_KD = 5*pi/180;         % KD value in X position control

Quad.Y_KP = 5*pi/180;          % KP value in Y position control
Quad.Y_KI = 2/1.98;            % KI value in Y position control
Quad.Y_KD = -5*pi/180;         % KD value in Y position control

Quad.Z_KP = -10/1.7;    % KP value in altitude control
Quad.Z_KI = 2/1.98;    % KI value in altitude control
Quad.Z_KD = 10/1.980;  % KD value in altitude control

Quad.phi_KP = 12;      % KP value in roll control
Quad.phi_KI = 3;       % KI value in roll control           
Quad.phi_KD = -.5;     % KD value in roll control
Quad.phi_max = pi/4;   % Maximum roll angle commanded

Quad.theta_KP = 12;    % KP value in pitch control
Quad.theta_KI = 3;     % KI value in pitch control
Quad.theta_KD = -.5;   % KD value in pitch control
Quad.theta_max = pi/4; % Maximum pitch angle commanded

Quad.psi_KP = 1.6;     % KP value in yaw control
Quad.psi_KI = .15;     % KI value in yaw control
Quad.psi_KD = -.2;     % KD value in yaw control

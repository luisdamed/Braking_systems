clc, close all
% Input data
Disc_data;
load Air_props.mat

m= 290 %car mass in kg
I=0.3546 %Moment of inertia of the rotating parts on the wheel [kg/m2]
V_i= 70/3.6 %Initial Vehicle Speed [m/s]
V_f=45/3.6 %Final Vehicle Speed [m/s]
V_mean=(V_f+V_i)/2
R_wheel=0.235 %Wheel Radius [m]
omega_i=V_i/R_wheel %initial wheel angular speed [rad/s]
omega_f=V_f/R_wheel %Final wheel angular speed [rad/s]
Decel_avg=0.5*9.81 %Average deceleration in [m/s^2]
Brake_bias=0.5 %Portion of the total braking load applied to the axle
t_stop= (V_i-V_f)/Decel_avg %Duration of the braking maneuver [s]
d_stop=(V_i^2-V_f^2)/(2*Decel_avg) %distance covered during braking in meters
t_cool=5 %Cooling time between braking maneuvers [s]
n_materials=6 %Define the number fo materials to compare. Uses Mat_properties.m
n= 100  %number of braking maneuvers to simulate
Cx=1.12; %Aerodynamic drag
S_car=1; %Front surface area of the car in m2

A_total=A_edge+2*A_side+A_holes; %Total surface area of the disc


%% Create arrays for processing
dt = 0.1; % sampling time for simulation

% Speed while braking
V_inst_brake = linspace(V_i,V_f, round(t_stop/dt))';

% Speed while driving
V_inst_acc = [linspace(V_f,V_i, round(t_stop/dt))'; repmat(V_i, round((t_cool - t_stop)/dt),1) ];

% Speed sequence
V_inst = repmat([V_inst_acc; V_inst_brake],n,1);
% index_braking = repmat([zeros(numel(V_inst_acc),1); ones(numel(V_inst_brake),1)],n,1);
index_braking = repmat([zeros(numel(V_inst_acc),1); linspace(1,numel(V_inst_brake),numel(V_inst_brake))'],n,1);

% Pre-allocate temperature array
T_disc_start = 60 + 273.15; % K
T_disc = repmat(T_disc_start, numel(V_inst), n_materials);



% Kinetic linear and rotational energies minus approximately the average
% energy dissipated by the aerodynamic drag.
Eb = 0.5*Brake_bias*((m/2)*(V_inst(1:end-1).^2-V_inst(2:end).^2)+ ...
     (I/2)*((V_inst(1:end-1)/R_wheel).^2 - ((V_inst(2:end)/R_wheel)).^2) - ...
     0.5*1.16*Cx*S_car*((V_inst(1:end-1)+V_inst(2:end))/2).^2*d_stop);

% Average power dissipated during the braking maneuver [W]
P_braking = Eb/t_stop;
P_braking(P_braking< 0) = 0;

for mat = 1:n_materials
    for i_temp = 2:numel(T_disc)-1
        T_disc(i_temp, mat) = temp_rise(T_disc(i_temp-1),  ...
                                    V_inst(i_temp), V_inst(i_temp-1), ...
                                    P_braking(i_temp-1), dt, mat, index_braking(i_temp-1));
    end
end

                








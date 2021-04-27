%INPUT DATA FOR HEAT TRANSFER CALCULATION
% clc
% clear all
% close all

% %-----------------FRONT DISC--------------------------------
 r_disc=218/2/1000;  %Disc Outer radius [m]
 h_disc=30/1000;   %Disc height [m]
 t_disc=3/1000;  %Disc Thickness [m]
 d_holes=3/1000; %Holes Diameter [m]
 N_holes= 200;   %Holes Number
 A_edge=2*pi*r_disc*t_disc; %Area of edge [m^2]
 A_fix= 306.53/1e6; %Area of one of the fixing legs of the rotor [m^2]
 A_side=pi*(r_disc^2-(r_disc-h_disc)^2)-N_holes*(pi*(d_holes/2)^2)+A_fix*6; %Side area [m^2]
 A_holes=N_holes*pi*d_holes*t_disc; %Area of the holes walls [m^2]
 V_disc=A_side*t_disc %Volume of the brake rotor [m3]
%  
% % % -----------------REAR DISC--------------------------------
%  r_disc=190/2/1000;  %Disc Outer radius [m]
%  h_disc=24/1000;   %Disc height [m]
%  t_disc=4/1000;  %Disc Thickness [m]
%  d_holes=8/1000; %Holes Diameter [m]
%  N_holes= 36;   %Holes Number
%  A_edge=2*pi*r_disc*t_disc; %Area of edge [m^2]
%  A_fix= 347.2/1e6; %Area of one of the fixing legs of the rotor [m^2]
%  A_side=pi*(r_disc^2-(r_disc-h_disc)^2)-N_holes*(pi*(d_holes/2)^2)+A_fix*6; %Side area [m^2]
%  A_holes=N_holes*pi*d_holes*t_disc; %Area of the holes walls [m^2]
%  V_disc=A_side*t_disc %Volume of the brake rotor [m3]
% %  
 
 A_ratio_side=A_side/(2*A_side+A_edge+A_holes);
 A_ratio_edge=A_edge/(2*A_side+A_edge+A_holes);
 
 h_pad=30/1000; %Pad height [m]
 w_pad=0.04975 %Pad width [m] 
 S_p=h_pad*w_pad  %Pad Friction Area [m^2]
 t_pad=4/1000 %Pad compoind thickness in m
 t_plate= 3.5/1000; %thickness of the backing plate in m
 S_d=pi*(r_disc^2-(r_disc-h_pad)^2)-N_holes*(pi*(d_holes/2)^2) %Disc Friction area [m^2]

 
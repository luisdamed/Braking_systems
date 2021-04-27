% %% Material properties
% function [rho_metal,k_metal,Cp_metal,k_pad,Cp_pad,rho_pad]= Mat_properties(T_disc,T_air,mat);
% %------------DISC PROPERTIES--------------------
% %Material definition
%       %1= High Alloyed Martensitic Stainless Steel (Reference: AISI 410)
%       %2= High alloyed Ferritic Stainless Steel (Reference: AISI 446)
%       %3= MMC Aluminum Sinter material
%       %4= Titanium alloy (Reference: Ti6Al4)
%       %5= Carbon steel (Reference AISI 1060)
%       %6= Gray Cast iron (Reference ASTM 40)
 
          T = T_disc(i)-273.5;
%           for i=1:length(T)
%               mat=2;
              
                    if mat==1
                        rho_metal=7740; %Density [kg/m3]
                       if T<100
                           k_metal=24.9;
                           Cp_metal=460;
                       else
                           k_metal=0.0095*T+ 23.9500; %Thermal Conductivity [W/mK]
                           Cp_metal=0.1*T + 450; %Specific Heat [J/kgK]
                       end

                    elseif mat==2
                       rho_metal=7800; %Density [kg/m3]
                       k_metal=(0.00008980370684893290*T + 0.20061671922950300000)*100;  %Thermal Conductivity [W/mK]
                       Cp_metal=(0.00004814992250246590*T + 0.11139284204593500000)*4184;  %Specific Heat [J/kgK]
                    elseif mat==3
                        rho_metal=2760; %Density [kg/m3]
                        k_metal=180;    %Thermal Conductivity [W/mK]
                        Cp_metal=950;   %Specific Heat [J/kgK]
                    elseif mat==4
                        rho_metal=4420; %Density [kg/m3]
                        k_metal=6.7;    %Thermal Conductivity [W/mK]
                        Cp_metal=526;   %Specific Heat [J/kgK]
                    elseif mat==5
                        rho_metal=7850; %Density [kg/m3]
                        k_metal=49.8;    %Thermal Conductivity [W/mK]
                        Cp_metal=502;   %Specific Heat [J/kgK]
                    elseif mat==6
                        rho_metal=7150; %Density [kg/m3]
                        k_metal=53.3;    %Thermal Conductivity [W/mK]
                        Cp_metal=490;   %Specific Heat [J/kgK]
                    end
                    
%           end
%           k_metal=[k_metal;T]
%           Cp_metal=[Cp_metal;T]
%             figure
%             plot(T,k_metal(1,:))
%             ylabel('Thermal conductivity [W/mK]')
%             xlabel('Temperature [°C]')
%             figure
%             plot(T,Cp_metal)
%             ylabel('Specific heat [J/kgK]')
%             xlabel('Temperature [°C]')
%             
%       end
  % m_disc=rho_metal*V_disc;  %Mass of the brake rotor [kg]
%---------------------- PAD PROPERTIES -----------------------  
k_pad=12; %1.31; %Thermal Conductivity of the pad [W/mK]
Cp_pad= 900;%1230; %Specific Heat of the pad material [J/kgK]
rho_pad=2500;%2400 %Density [kg/m3]
k_plate= 15;  %Thermal Conductivity of the backing plate[W/mK]
              %Assumed to be a low conductivity stainless steel alloy
              %This is a worst case, since it could be titanium.

% end 

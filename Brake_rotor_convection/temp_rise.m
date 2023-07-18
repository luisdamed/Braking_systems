function T_disc_new = temp_rise(T_disc_inst,  V_f, V_i, P_inst, dt, mat, i)

    V_mean = (V_i+V_f)/2;
   
% Load disc data
            Disc_data;
% Load  the material properties library
            [rho_metal,k_metal,Cp_metal,k_pad,Cp_pad,rho_pad] = f_MatProperties(T_disc_inst,mat); 
% Load Air properties
            load Air_props.mat

%Air Temperature [K]
            T_air=25+273.15; 
            
            %Film Temperature [K]
            T_film=(T_air+T_disc_inst)/2; 

% Air Properties vs Temperature  
            %Air density at film temperature [kg/m3]
            rho_air_f = interp1(Air_props.Temp,Air_props.Density,...
                T_film-273.15); 
            
            %Air Dynamic viscosity at film temperature [kg/ms]
            mu_air_f = interp1(Air_props.Temp,Air_props.Dyn_Visc,...
                T_film-273.15); 
            
            %Air Specific heat at film temperature [J/kgK]
            Cp_air_f = interp1(Air_props.Temp,Air_props.Spec_Heat,...
                T_film-273.15); 
            
            %Air Thermal conductivity at film temperature [W/mK]
            k_air_f = interp1(Air_props.Temp,Air_props.Conductivity,...
                T_film-273.15); 

            %Reynolds number evaluated at film temperature
            Re_f=(V_mean*r_disc*2*rho_air_f)/mu_air_f;    
            
%             %Prandtl number evaluated at film temperature
%             Pr_f=mu_air_f *Cp_air_f/k_air_f;             

            % Heat transfer coefficient 
            % This expression is mentioned in reference [1]. It was         
            % determined experimentally on disc brakes for light trucks, 
            % but can also be used in other applications to a certain extent. 
            % Verified with Convection_coefficients.mlx script and  t
            % he results showed good correlation with CFD analyses at 60 km/h

             h_conv=0.04*(k_air_f/(2*r_disc))*Re_f^0.8;

             %Biot number. The following equations are valid only for Bi<0.1
             Bi=h_conv*(V_disc/(A_total))/k_metal;  
                if Bi>0.09999
                   error(['The Biot number must be lower than 0.1 to assume an ' ...
                       'uniform disc temperature distribution (lumped analysis)'])
                end

            % Heat Transfer Disc/Pad 
            % The factor "p" determines the portion of heat which is 
            % transferred to the rotor body during continuous braking.

            p=sqrt(k_metal*Cp_metal*rho_metal)*S_d/...
            (sqrt(k_metal*Cp_metal*rho_metal)*S_d+...
                  sqrt(k_pad*Cp_pad*rho_pad)*S_p); 

            % Calculate the temperature rise on the disc


            % Cool down the disc while not braking
            %Heat dissipated by convection [W]
            H_convection=(h_conv*A_total)*(T_disc_inst-T_air);
            
            %Heat dissipated by radiation [W]
            H_radiation= 5.670367*10^-8*A_total*2*(T_disc_inst-T_air)^4; 
            
            % During braking, only a portion of the disc's surface is used for cooling
            f = (S_d - (2*S_p)) / S_d; % ~ 0.8
    
            % Compute cooling
            Dt_cool=(-H_convection-H_radiation)*(dt)/(rho_metal*V_disc*Cp_metal);
    
            Dt_brake = P_inst * dt * p / (rho_metal* V_disc * Cp_metal);
    
            % Temperature increase of the rotor
            DT_f = Dt_brake + Dt_cool * f;
%                 BixFo=h_conv*A_total*dt/(rho_metal*V_disc*Cp_metal);
% 
%             if P_inst ~= 0 && BixFo > 0 
% 
%                 T_disc_new = T_air+(1-exp(-i*BixFo))*DT_f/(1-exp(-BixFo));
%             else
                T_disc_new = T_disc_inst + DT_f;
%             end


end
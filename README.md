# Braking_systems
Utility MATLAB scripts that I used when writing my MSc thesis, in 2019, about the braking system of the 2018 Formula Student race car from Squadra Corse Polito.

I am publishing the ones that could be useful to other students facing the design of a braking system. However, these are just preliminary analysis tools that help visualize the impact of different parameters on the braking system load repartition and the thermal response of the brake discs.

There are two sets of scripts:

## Brake rotor convection study
Study the temperature rise of a brake disc during a single stop and during continuous operation, simulating "N" identical braking maneuvers. There is also an estimation of the brake discs convection coefficient in terms of the vehicle speed, which could be useful to get a rough initial idea of its trend.

### Single-stop temperature rise
![Single_stop_disc_temperature_rise](https://github.com/luisdamed/Braking_systems/blob/main/Brake_rotor_convection/Single_stop_disc_temperature_rise.png?raw=true)


### Simulated temperature during continuous braking
![Disc_temperature_simulation](https://github.com/luisdamed/Braking_systems/blob/main/Brake_rotor_convection/Disc_temperature_simulation.png?raw=true)




## Brake load repartition study
Evaluate the distribution of braking forces in the front and rear axle in ideal conditions, and compare with the system response, based on the vehicle data (mass, geometry, hydraulic system components).

### Ideal brake force repartition
![Ideal_braking_force_repartition](https://github.com/luisdamed/Braking_systems/blob/main/Brake_load_repartition/Ideal_braking_force_repartition.png?raw=true)

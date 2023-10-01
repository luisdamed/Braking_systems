# Braking_systems

Utility MATLAB scripts that I used when writing my MSc thesis, in 2019, about the braking system of the 2018 Formula Student / Formula SAE race car from Squadra Corse Polito.

I am publishing the ones that could be useful to other students facing the design of a braking system. However, these are just preliminary analysis tools that help visualize the impact of different parameters on the braking system load repartition and the thermal response of the brake discs.

There are two sets of scripts:

## Brake load repartition study

This script can help be used to evaluate the distribution of braking forces in the front and rear axle, and compare the ideal behavior while braking from different speeds with the actual system response, based on the vehicle data (mass, geometry, hydraulic system components, etc).

If you are interested in knowing more, **[check out this short explanation of what I did](https://medium.com/@luisdamed/brake-system-load-distribution-study-matlab-approach-2f35b426ee0d)**.

![Ideal_braking_force_repartition](https://github.com/luisdamed/Braking_systems/blob/main/Brake_load_repartition/Ideal_braking_force_repartition.png?raw=true)

---

## Simulated temperature during continuous braking

I used a lumped model approach to estimate the working temperature of brake rotors, after repeatedly performing a braking maneuver.
I wrote **[an article with a short description of the formulation used](https://medium.com/@luisdamed/estimating-the-working-temperature-of-a-brake-disc-aee43a4ba6ab)**. Make sure to read if you plan to use the script as a base for your own project.

![Disc_temperature_simulation](https://github.com/luisdamed/Braking_systems/blob/main/Brake_rotor_convection/Disc_temperature_simulation.png?raw=true)

---

## Brake rotor convection study

An estimation of the brake discs convection coefficient in terms of the vehicle speed, which could be useful to get a rough initial idea of its trend.

You can find a more detailed description in
**[this blog post, including some of the experimental results](https://medium.com/@luisdamed/computing-the-convection-coefficient-of-a-brake-disc-fe59a98d64b)**

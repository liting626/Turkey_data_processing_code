# Turkey_data_processing_code
This is the code to process the Turkey observed data from the Doppler Sounding System and the seismometer PRA.
Observed vs. Simulated Data Comparison for the Türkiye Earthquake
This repository contains observed seismic data and numerical simulation results from the Türkiye earthquake, focusing on three-component velocity recordings from the PRA seismic station and Doppler shift measurements with corresponding simulations.

Data Files Description
1. Seismic Observation Data
PRAseisdata_xyz.mat
Three-component (X/Y/Z) observed velocity data from the PRA station in MATLAB .mat format, containing:

t: Time vector (in seconds, where t=0 corresponds to 10:30 UTC)

vx, vy, vz: Velocity components in three directions (units: μm/s or as specified)

2. Seismic Simulation Data
seis_simulation.mat
Corresponding simulated velocity data matching the observations, with variables named consistently (e.g., vx_sim, vy_sim, vz_sim).

3. Doppler Shift Observations
230206_1030_4mhz.mat
Raw Doppler shift measurements in MATLAB .mat format:

Column 1: Time vector (t=0 at 10:30 UTC)

Subsequent columns: Doppler shift signals from transmitters Tx1 to Tx5 (units: Hz)
Note: The code converts Doppler shifts to velocities (see code comments for formula).

4. Doppler Simulation Data
doppler_simulation.mat
Simulated velocity data at 153 km altitude for comparison with Doppler observations.

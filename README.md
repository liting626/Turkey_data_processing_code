# Observed vs. Simulated Data Comparison for the Turkey Earthquake

This repository contains processing codes and datasets for comparing observed data with numerical simulations from the Turkey earthquake event.

## Data Files

### Observation Data
- `PRAseisdata_xyz.mat` - Three-component velocity data from PRA seismic station:
  - Column 1: vx
  - Column 2: vy
  - Column 3: vz

### Simulation Data 
- `seis_simulation.mat` - Simulated three-component velocity data matching PRA observations
  - Column 1: Time
  - Column 2-4: simulated vx, vy, and vz 

### Doppler Shift Data
- `230206_1030_4mhz.mat` - Doppler shifts measurements:
  - Column 1: Time (t=0 at 10:30 UTC) 
  - Columns 2-6: Doppler shifts for transmitters Tx1-Tx5 (units: Hz)

### Doppler Simulation
- `doppler_simulation.mat` - Simulated velocity data at 153 km altitude

## Code Description

### Main Scripts
- Converts Doppler shifts to velocities
- Filters the observed data
- Generates comparison plots

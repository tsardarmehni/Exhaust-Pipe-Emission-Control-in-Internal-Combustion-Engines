# Exhaust-Pipe-Emission-Control-in-Internal-Combustion-Engines-Using-AI

## **Problem Statement**
Spark Ignition Internal Combustion Engines (SI ICE) are among the most common causes of air pollution in urban areas. 
Research shows that catalytic converters can eliminate almost all emission pollutants if we can control the normalized air-to-fuel ratio (lambda) around ± 1% of the stoichiometric value of 1. The automotive industry relies primarily on Proportional-Integral (PI) controllers to regulate the amount of lambda. However, PI controllers are inherently linear and do not provide robust performance in the presence of nonlinearities. 

In this project, we designed and implemented Model Predictive Control to regulate lambda in ±1% of the stoichiometric value. 
We first trained a neural network with offline data from the engine subject to random square waves and then used this neural network to develop the MPC. 

Interested readers are referred to https://link.springer.com/article/10.1016/j.acme.2013.05.003. 

## **Dynamics of the Engine** 
This repository includes one **Simulink** file and two **MATLAB** m-files. 

1. The simulink file includes the Mean Value Engine Model (MVEM) that models the dynamics of 4 subsystems in the engine: 
- Subsystem 1: fuel film deposited in the intake manifold 
- Subsystem 2: crankshaft
- Subsystem 3: intake manifold airflow 
- Subsystem 4: oxygen sensor

Interested readers are referred to the following papers/books: 
- https://link.springer.com/article/10.1016/j.acme.2013.05.003.
- https://www.sae.org/publications/technical-papers/content/900616/
- https://orbit.dtu.dk/en/publications/modelling-of-the-manifold-filling-dynamics
- https://iopscience.iop.org/article/10.1088/0957-0233/11/12/708/meta;

2. The first m-file, "engine_initials.m", includes all the parameters in the engine model. You MUST run this file first. Otherwise, the simulink file will not work.
3. The second m-file, "predictive_controller.m", is a function  that runs the MPC with the gradient descent. This file also includes the correction of the desired lambda to decay smoothly to the value of 1.
## Summary    
### States 
The system's states are fuel film mass flow rate (subsystem 1), crankshaft rotational speed (subsystem 2), intake manifold air pressure (subsystem 3), and oxygen sensor lambda (subsystem 4). 
### Control Signals
The overal inputs of the engine are 3 in general: ignition advance, injected fuel mass flow rate, and throttle plate angle. For the control purpose, the code considered a fixed ignition advance and includes throttle plate angle as a noise. Therefore, the only control signal is the injected fuel mass flow rate. 
To generate the controls, a model predictive control (MPC) system in establised which uses a neural network to find the control signals. The neural network is trained offline via data gathered from the engine. 
### Control Goal 
The control goal is keeping lambda inside the window of ± 1% of the stoichiometric value of 1. 

### **How to Run the Code** 
The Simulink model is exported as a MATLAB 2012 version, so you must have at least a 2012 version of Matlab installed on your machine. 
- First run "engine_initials.m"
- Then, run the Simulink model.


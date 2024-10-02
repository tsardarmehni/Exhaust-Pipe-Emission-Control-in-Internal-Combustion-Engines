# Exhaust-Pipe-Emission-Control-in-Internal-Combustion-Engines-Using-AI

## **Problem Statement**
Spark Ignition Internal Combustion Engines (SI ICE) are among the most common causes of air pollution in urban areas. 
Research shows that if we can control the normalized air-to-fuel ratio (lambda) around ± 1% of the stoichiometric value of 1, catalytic converters can eliminate almost all emission pollutants. 
The automotive industry mostly relies on Proportional-Integral (PI) controllers to regulate the amount of lambda. However, PI controllers are inherently linear and do not provide robust performance in the presence of nonlinearities. 
In this project, we designed and implemented Model Predictive Control to regulate lambda in ±1% of the stoichiometric value. 
We first trained a neural network with offline data from the engine subject to random square waves and then used this neural network to develop the MPC. 
Interested readers are referred to https://link.springer.com/article/10.1016/j.acme.2013.05.003 


## **Dynamics of the Engine** 
This repository includes a Simulink file. The simulink file includes the Mean Value Engine Model (MVEM) that models the dynamics of 4 subsystems in the engine. 
- Subsystem 1: fuel film deposited in the intake manifold 
- Subsystem 2: crank shaft
- Subsystem 3: intake manifold air flow 
- Subsystem 4: oxygen sensor 

## **Control Signals**
The overal inputs of the engine are 3 in general: ignition advance, injected fuel mass flow rate, and throttle plate angle. For the control purpose, the code considered a fixed ignition advance and includes throttle plate angle as a noise. Therefore, the only control signal is the injected fuel mass flow rate. 
To generate the controls, a model predictive control (MPC) system in establised which uses a neural network to find the control signals. The neural network is trained offline via data gathered from the engine. 

## **How to Run the Code**

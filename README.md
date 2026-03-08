# Pendulo-de-Furuta
<p align="center">
  <img src="https://raw.githubusercontent.com/ricardofelipe-bravo/Pendulo-de-Furuta/main/FP.jpg" width="400">
</p>

---

## Comparación de Estrategias de Control

Este repositorio presenta una comparación de diversas estrategias de control aplicadas a un péndulo rotacional de **Furuta**, simulado en el entorno **CoppeliaSim**.  
Se implementaron y evaluaron los controladores **Gain Scheduling**, **Regulador Cuadrático Lineal (LQR)**, **Realimentación de Estados**, **MPC (Model Predictive Control)** y **Controlador Fuzzy**.

El objetivo principal es **analizar y comparar el desempeño** de cada controlador, destacando sus ventajas, limitaciones y justificación teórica dentro del marco de control óptimo y no lineal. Este trabajo fue parte de la ponencia presentada en la **IEEE Colombian Conference on Automatic Control (CCAC 2025)**.

---

## 📁 Repository Structure

The project is organized into two primary validation approaches to ensure a robust transition from theory to virtual prototyping:

### 1. Plant Simulations (`/Scripts_Matlab`)
This directory contains individual MATLAB scripts where the mathematical plant is simulated using each designed control strategy:
* **State Feedback:** Pole placement design for system stabilization.
* **LQR (Linear Quadratic Regulator):** Optimization of $Q$ and $R$ weighting matrices to minimize error (ITAE) and control effort.
* **Fuzzy Control:** Implementation of fuzzy logic rules to handle non-linear system dynamics.
* **MPC (Model Predictive Control):** Predictive control strategy for constraint management and optimal trajectory tracking.
* **Gain Scheduling:** Adaptation of controller gains based on different operating points of the pendulum.

### 2. Real-Time Co-Simulation (`/Matlab_y_CoppeliaSim`)
This module performs experimental validation in a high-fidelity virtual environment:
* **CoppeliaSim Scene:** Includes the 3D physical model with actuators and sensors.
* **Remote API Synchronization:** MATLAB scripts acting as the control server, sending command signals and receiving telemetry from the simulator via a synchronous communication link.



## Methodology and Results
The project focuses on the **swing-up** maneuver from the rest position and the subsequent **stabilization** at the unstable equilibrium point. A comparative analysis was conducted using performance metrics such as **ITAE** (Integral of Time-weighted Absolute Error) and **actuator saturation** analysis to determine the most efficient strategy for real-world applications.

## Requirements
* **MATLAB** (Control System Toolbox recommended).
* **CoppeliaSim** (Remote API enabled).

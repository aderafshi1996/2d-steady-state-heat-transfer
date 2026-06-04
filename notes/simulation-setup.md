# Simulation Setup

## Problem Definition

This project solves the two-dimensional steady-state heat conduction equation inside a square domain using:

1. Finite Difference Method (Fortran)
2. ANSYS Fluent

The purpose is to compare numerical solutions obtained from custom code and commercial CFD software.

---

# Geometry

* Geometry type: 2D square domain
* Domain size: 1 m × 1 m

For the aspect ratio study, the x-direction length was doubled.

---

# Mesh Information

## Finite Difference Grid

| Parameter | Value |
| --------- | ----- |
| Nx        | 20    |
| Ny        | 20    |

Uniform grid spacing was used in both x and y directions.

---

## Fluent Mesh

A structured quadrilateral mesh was generated in ANSYS Meshing.

### Mesh Settings

| Parameter        | Value      |
| ---------------- | ---------- |
| Relevance Center | Fine       |
| Smoothing        | Medium     |
| Transition       | Slow       |
| Mesh Type        | Structured |

---

# Governing Equation

The governing equation is the steady-state 2D heat conduction equation without internal heat generation:

```text
∂²T/∂x² + ∂²T/∂y² = 0
```

---

# Finite Difference Discretization

The discretized equation used in the Fortran code is:

```text
T(i,j) = ( T(i+1,j) + T(i-1,j) + T(i,j+1) + T(i,j-1) ) / 4
```

An iterative approach was used to update temperature values until convergence.

---

# Boundary Conditions

## Base Case

| Boundary    | Temperature |
| ----------- | ----------- |
| Left Wall   | 100°C       |
| Right Wall  | 100°C       |
| Top Wall    | 0°C         |
| Bottom Wall | 0°C         |

---

## Variable Boundary Condition Case

The boundary temperature distribution was modified as:

```text
T(i,0)  = 100 × sin(i × π / Nx)
T(i,Ny) = 100 × sin(i × π / Nx)
```

---

# Fluent Solver Settings

| Setting                | Value                   |
| ---------------------- | ----------------------- |
| Solver Type            | Steady                  |
| Energy Equation        | Enabled                 |
| Material               | Default solid           |
| Spatial Discretization | Second Order            |
| Initialization         | Standard Initialization |

---

# Post-Processing

The following outputs were extracted:

* Temperature contours
* Temperature comparison plots
* Aspect ratio effects
* Variable boundary condition effects

Tecplot was used for visualization of Fortran results.

---

# Validation

The Fortran finite difference solution was compared with ANSYS Fluent results.

The comparison showed good agreement between:

* Temperature contours
* Midline temperature distributions

This validates the numerical implementation.

---

# Observations

* Heat penetration decreases as domain length increases.
* Spatially varying boundary conditions significantly affect the temperature field.
* The finite difference method successfully reproduces Fluent results.

---

# Author

Ali Darfashi


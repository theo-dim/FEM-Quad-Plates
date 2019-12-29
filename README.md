# Quadrilateral Plate Elements
Implementation and analysis of a quadrilateral plate element in MATLAB

**The following is an implemention and analysis of a plate quad element in MATLAB. L = 10 m, t = 100 mm, E = 30 x 106 MPa, and υ = 0.3.**

Analysis inludes permutations of the following:
1.) Supports (in both cases, all perimeter displacements are restrained)
* Edges are fully clamped (all perimeter rotations are restrained)
* Edges are simply supported (all perimeter rotations are released)
2.) Loading
* Distributed load of q = 10 Pa downward applied to the entire plate
* Concentrated load of P = 1 kN downward applied to the plate center
3.) Mesh Refinement: quadrant is modelled with 1, 4, 16, and 64 elements
4.) Gaussian Quadrature: shear stiffness found using 1x1 and 2x2 integration

Graphs and tabulations of the normalized center deflection of the plate against the logarithm of the number of elements (nel) used are included in the analysis.

The exact solutions for the center deflection are provided below:

|   |   |   |   |   |
|---|---|---|---|---|
|   |   |   |   |   |
|   |   |   |   |   |
|   |   |   |   |   |

Your deliverable is a report which should include, but does not need to be limited to: the above convergence studies, code changes, code description, deformed geometries, displacement tabulations, stress or stress resultant analyses (in plot and/or tabulated form), and discussions. While an exhaustive set of results is not expected (irrelevant/redundant content will likely cost you points), you should include a sufficient cross-section of results to demonstrate the element performance.
One report and one set of code are expected per group. Discussion or sharing of work between groups is not permitted. Groups are to contain no more than two students unless permission is received from the instructors. A hard copy of the report is to be submitted in E218 and a single .zip file containing all MATLAB scripts is to be sent to fabieng@princeton.edu by the deadline.

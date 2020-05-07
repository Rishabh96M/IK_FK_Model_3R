# IK_Model_3R
Inverse Kinematics and Forward Kinematics model of a system having 1 roll motor and 2 pitch motors on MATLAB. Calculates all the angles for a given locus or trajectory of the end effector. You can also visualize it on a graph.

### Requirments
Matlab or Octave

### Getting Started
Open the IK_FK_3R_trajectory.m function, it is ready to run.


```
11. L=[47.3,63.6,100];
```
You change the link lengths vector according yo your requirments. 


```
13. [X,Y,Z] = circle(60,30,10,133,100);
```
You can change the parameters for the trag function to modify the trajectory. If you wish to give a new trajectory function you can do so by replacing it with trag function, but please make sure the output of the function is the required format.

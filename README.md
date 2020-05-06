# IK_Model_3R
Inverse Kinematics model of a system having 1 roll motor and 2 pitch motors on MATLAB. Calculates all the angles for a given point of the end effector. You can also trace a given set of corordinates and visualize it on a graph.

### Requirments
Matlab R2015a or above

### Getting Started
Open the IK_FK_3R_trajectory.m function, it is ready to run.


```
11. L=[47.3,63.6,100];  %Vector for link lengths 
```
You change the link lengths vector according yo your requirments. 


```
13. [X,Y,Z] = trag(60,30,10,133,100);  %Computing the trajectory
```
You can change the parameters for the trag function to modify the trajectory. If you wish to give a new trajectory function you can do so by replacing it with trag function, but please make sure the output of the function is the required format.

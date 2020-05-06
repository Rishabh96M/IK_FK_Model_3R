function [R_z] = RZ(Z_angle)
%{
DESCRIPTION : Rotation about Z axis.

INPUTS : Z_angle = angle to rotate about Z axis in radians

OUTPUTS : 4*4 Rotation Matrix 

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

R_z=[cos(Z_angle), -sin(Z_angle), 0,    0;
     sin(Z_angle), cos(Z_angle),  0,    0;
     0         ,     0     ,  1,    0;
     0         ,     0     ,  0,    1];


end


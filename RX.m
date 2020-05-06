function [R_x] = RX(X_angle)
%{
DESCRIPTION : Rotation about x axis.

INPUTS : x_angle = angle to rotate about X axis in radians

OUTPUTS : 4*4 Rotation Matrix 

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

R_x=[1,            0,           0  , 0;
     0, cos(X_angle), -sin(X_angle), 0;
     0, sin(X_angle),  cos(X_angle), 0;
     0,          0  ,      0       , 1];

end


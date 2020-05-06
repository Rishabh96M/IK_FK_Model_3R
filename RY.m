function [R_y] = RY(Y_angle)
%{
DESCRIPTION : Rotation about Y axis.

INPUTS : y_angle = angle to rotate about y axis in radians

OUTPUTS : 4*4 Rotation Matrix 

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

R_y=[cos(Y_angle),  0,  sin(Y_angle), 0;
     0           ,  1,             0, 0;
    -sin(Y_angle),  0, cos(Y_angle) , 0;
        0        ,  0,          0   , 1];

end
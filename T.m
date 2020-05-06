function [T] = T(X_trans,Y_trans,Z_trans)
%{
DESCRIPTION : TRANSFORMATION MATRIX - TRANSLATION ABOUT X,Y,Z

INPUTS : 
 X_trans = Translation in X axis
 Y_trans = Translation in Y axis
 Z_trans = Translation in Z axis

OUTPUTS : 4*4 Transformation Matrix

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

T=[1,0,0,X_trans;
   0,1,0,Y_trans;
   0,0,1,Z_trans;
   0,0,0,1];

end


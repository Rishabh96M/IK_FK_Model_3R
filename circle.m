function [X,Y,Z] = circle(r,Xoff,Yoff,Zoff,s)
%{
DESCRIPTION : Plots a circle of given radius and number of segements.

INPUTS :
 r = Radius of circle
 Xoff = Offset in X axis
 Yoff = Offset in Y axis
 Zoff = Offset in Z axis
 s = number od segements

OUTPUTS :
 X = vector of length s with corresponding X co-orinates
 Y = vector of length s with corresponding Y co-orinates
 Z = vector of length s with corresponding Z co-orinates

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

th = linspace(0,2*pi,s);
X = r * cos(th) + Xoff;
Y = r * sin(th) + Yoff;
Z = ones(1,s)*Zoff;
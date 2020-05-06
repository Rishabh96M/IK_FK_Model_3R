function [x,y,z] = trag(a,b1,b2,h,s)
%{
DESCRIPTION : Generates a trjectory of 2 semi ellipsis, for swing and strike repectively.

INPUTS :
 a*2 = step length
 b1 = maximum step height 
 b2 = semi major axis of the ellipse in the strike phase
 h = height of the quadruped from the ground
 s = no of segements in one step

OUTPUTS : 3 Vectors X, Y and Z of length 's' (The coordinates for trajectory) 

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}


%swing ellipse
x1 = linspace(a,-a,floor(2*s/7));      %Swing phase is 3 2/7th of the totoal cycle for the stability of the quadruped
y1 = ones(1,length(x1));               
z1 = b1*sqrt(1 - (x1.^2)/(a^2)) - h;   

%strike ellipse
x2 = linspace(-a,a,floor(5*s/7));
y2 = b2*sqrt(1 - (x2.^2)/(a^2));
z2 = zeros(1,length(x2)) - h;

%Concatenating swing and strike
x = [x1 x2]; 
y = [y1 y2];
z = [z1 z2];

% plot3(x,y,z);
% axis equal;
% xlabel('x');
% ylabel('y');
% zlabel('z');
% grid on;

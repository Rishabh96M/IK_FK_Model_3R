function [x,y,z] = trag(a,b1,b2,h,s)

% a*2 = step length
% b1 = step height
% b2 = semi major axis of the ellipse in the strike phase
% h = height of the robot from the ground
% s = no of segements in one step

%swing
x1 = linspace(a,-a,floor(s/7));
y1 = ones(1,length(x1));
z1 = b1*sqrt(1 - (x1.^2)/(a^2)) - h;

%strike
x2 = linspace(-a,a,floor(6*s/7));
y2 = b2*sqrt(1 - (x2.^2)/(a^2));
z2 = zeros(1,length(x2)) - h;

x = [x1 x2];
y = [y1 y2];
z = [z1 z2];

% plot3(x,y,z);
% axis equal;
% xlabel('x');
% ylabel('y');
% zlabel('z');
% grid on;

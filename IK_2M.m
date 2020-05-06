function [T] = IK_2M(x1,y1,z1,L)

%(x1,y1,z1) = end effector point
%L = vector of link lengths

l1=L(1);     
l2=L(2);   
l3=L(3);

y = y1 - l1;
x = x1;
t1 = atan(y/z1);
z = -sqrt((y^2)+(z1^2)) + l1*sin(t1);

t2 = atan2(-(z)/sqrt((x^2)+(z^2)),-(x)/sqrt((x^2)+(z^2))) - acos(-((x^2)+(z^2)+(l2^2)-(l3^2))/((2*l2)*(sqrt((x^2)+(z^2)))));
z2 = (z-l2*sin(t2))/l3;
x2 = (x-l2*cos(t2))/l3;
t3 = atan2(z2,x2) - t2;

T=[t1,t2,t3];
    

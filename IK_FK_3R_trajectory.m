%{
DESCRIPTION : Calculates the IK for a trajectory and performs FK to plot it.

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}

clear all;
L=[47.3,63.6,100];  %Vector for link lengths 

[X,Y,Z] = trag(60,30,10,133,100); %Computing the trajectory

Y = Y + L(1);  %adding offset in Y axis

%executing trajectory
for i=1:length(Z)
    x = X(i);   
    z = Z(i);
    y = Y(i);
    [JA] = IK_3R(x,y,z,L); %Calculating Joint Angles
    dmt = [-1 -1 -1];  %Inverting the direction of rotaation of the joints repectively
    JA = JA.*dmt;
    joint1_val = JA(1);       
    joint2_val = JA(2);
    joint3_val = JA(3);
    
    %Forward Kinematics
    F0 = T(0,0,0)*RX(joint1_val);
    F1 = F0*T(0,L(1),0)*RY(joint2_val);
    F2 = F1*T(L(2),0,0)*RY(joint3_val);
    F3 = F2*T(L(3),0,0);

    %plotting         
    plot_line(F0,F1);
    hold on;
    
    plot_line(F1,F2);
    plot_line(F2,F3);
    plot_transformation_frame(F0); 
    plot_transformation_frame(F1); 
    plot_transformation_frame(F2); 
    plot_transformation_frame(F3);
    plot3(X,Y,Z)
    axis equal;
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;
    
    pause(0.1)
    hold off;
end

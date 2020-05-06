clear all;
L=[47.3,63.6,100];  %for right -47.3,63.6,130 

%[X,Y,Z] = circle;
[X,Y,Z] = trag1(60,30,0,133,100);
%[X,Y,Z] = rpy(157,10);
%[X,Y,Z] = circle;
%len = length(X);

Y = Y + L(1);
%executing trajectory
for i=1:length(Z)
    x = X(i);   
    z = Z(i);
    y = Y(i);
    [JA] = IK_2M(x,y,z,L);
    dmt = [-1 -1 -1];
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

function [] = plot_transformation_frame(f)
%{
DESCRIPTION : Plots trasformation frame on the graph.

INPUTS : f = transformation matrix

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}
Rx=f(:,1);
Ry=f(:,2);
Rz=f(:,3);
Tx=f(1,4);
Ty=f(2,4);
Tz=f(3,4);

plot3([Tx,3*Rx(1)+Tx],[Ty,3*Rx(2)+Ty],[Tz,3*Rx(3)+Tz],'r','linewidth',2);
plot3([Tx,3*Ry(1)+Tx],[Ty,3*Ry(2)+Ty],[Tz,3*Ry(3)+Tz],'g','linewidth',2);
plot3([Tx,3*Rz(1)+Tx],[Ty,3*Rz(2)+Ty],[Tz,3*Rz(3)+Tz],'b','linewidth',2);
end
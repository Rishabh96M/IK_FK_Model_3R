function [] = plot_line(f1,f2)
%{
DESCRIPTION : Plots line between 2 transformation matrices

INPUTS : f1 and f2 = transformation matrices

DEVELOPED BY : Rishabh Mukund
    EMail ID : rishabh.m96@gmail.com
    LinkedIn : https://www.linkedin.com/in/rishabh-mukund-2a3340140/
    GitHub   : https://github.com/Rishabh96M
%}
plot3([f1(1,4),f2(1,4)],[f1(2,4),f2(2,4)],[f1(3,4),f2(3,4)],'k','linewidth',4);
end

clear
close all

np=501;
x=linspace(-1/exp(1), 3, np);
y=lambertw(0,x);
plot(x,real(y),'r','LineWidth',1)
hold on
x=linspace(-1/exp(1), 0, np);
y=lambertw(-1,x);
plot(x,real(y),'b--','LineWidth',1)
% sets the axis limits to the range of the data
axis tight
% set x and y labels
xlabel('$x$', 'Interpreter','latex','FontSize',24)
ylabel('$W(x)$', 'Interpreter','latex','FontSize',24)
% returns current axes of the figure
ha=gca;
%altering axes properties
ha.XAxisLocation='origin';
ha.YAxisLocation='origin';
ha.YLim=[-7 3];
ha.FontSize=18;
ha.FontWeight='bold';
% returns current figure handle
hf=gcf;
hf.WindowState='maximized';

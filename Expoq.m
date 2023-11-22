close all;
clear;
clc;

expq = @(x,q) (1 + (1-q).*x).^(1./(1-q))
%expr = @(x,r) (1 + x./r).^r
qv=[ 0.25 0.5 0.999 1.25 1.5 ];
np=250;
x=linspace(-1,3, np);
for i=1: length(qv)
    q=qv(i);

plot(x,expq(x,q),LineWidth=1)
% plot(x,expr(x,1/(1-q)),'LineWidth',1)
hold on
end
% plot x and y axis
xline(0)
yline(0)
% set x and y labels
xlabel('$x$',Interpreter="latex",FontSize=18)
ylabel('$e_{q}^{x}$',Interpreter="latex",FontSize=18)
% set limits
ylim([-0 4])
% the arrows
XY=axis
x0 = 1*(XY(2) - XY(1))/100;  
y0 = 2*(XY(4) - XY(3))/100;
SetasX=[XY(2)-x0 -x0/2;XY(2)-x0 0 ;XY(2) +x0/2]
SetasY=[-y0/2 XY(4)-y0;+y0/2 XY(4);0 XY(4)-y0]
%Triangulo 1 >> Eixo x
SetasX=[XY(2)-x0;XY(2)-x0;XY(2)]
SetasY=[-y0/2   ;+y0/2   ;0]
patch(SetasX, ...
      SetasY, 'k', 'clipping', 'off')
x0=x0;
y0=y0;
%Triangulo 2 >> Eixo y
SetasX=[-x0/2   ;0    ;+x0/2]
SetasY=[XY(4)-y0;XY(4);XY(4)-y0]
patch(SetasX, ...
      SetasY, 'k', 'clipping', 'off')
% set legend
legend({'$q=0,25$','$q=0,5$','$q=1$', '$q=1.25$', 'q=1.5'},Interpreter="latex",Location="northwest")
% save command
set(gca, Color="none"); % Sets axes background
export_fig expq.png -transparent -native
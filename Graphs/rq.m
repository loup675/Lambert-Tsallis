close all;
clear;
clc;

r=linspace(-4,0,500)
q=@(r)(r-1)./r
plot(r,q(r),Color='b',LineStyle="-",LineWidth=1)
hold on
r=linspace(0,4,500)
plot(r,q(r),Color='b',LineStyle="-",LineWidth=1)
% sets x and y limits
ylim([-40 40])
% plot x and y axis
xline(0)
yline(1,'--r')
yline(0)
% set x and y labels
xlabel("$q$",Interpreter="latex",FontSize=18)
ylabel("$r(q)$",Interpreter="latex",FontSize=18)
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
% save command
set(gca, 'Color', 'none'); % Sets axes background
export_fig rq.png -transparent -native

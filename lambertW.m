close all;
clear;
clc;

X1=linspace(-1/exp(1),10,500);
Y1=lambertw(0,X1);
plot(X1,Y1,LineStyle="-",Color="#3F19FF")
hold on % hold up, wait a minute
X2=linspace(-1/exp(1),0,500);
Y2=lambertw(-1,X2);
plot(X2,Y2,LineStyle="--",Color="#FF350B")
% plot x and y axis
xline(0)
yline(0)
% sets x and y limits
xlim([-1 5])
ylim([-7 2])
% set x and y labels
xlabel("$x$",Interpreter="latex",FontSize=18)
ylabel("$W_{k}(x)$",Interpreter="latex",FontSize=18)
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
% legend setup
legend('k=0','k=-1','Location','best')
% save command
set(gca, 'Color', 'none'); % Sets axes background
export_fig lambertW.png -transparent -native
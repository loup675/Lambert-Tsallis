close all;
clear;
clc;
r=-3; % r<0 integer
x0=-abs(r)*5;
x1=abs(r)*5;
x=linspace(x0,x1,1000);
y=@(u)u.*(1+u./r).^r;
y1=y(x);
y1(abs(y1)>abs(r)*3)=NaN;
Wb=-r/(r+1);
ramo1=Wb<=x & x<-r;
plot(y1(ramo1),x(ramo1),Color='#FF350B',LineWidth=1.2)
hold on
ramo2=x<Wb;
plot(y1(ramo2),x(ramo2),Color='#3F19FF',LineWidth=1.2)
ramo3=x>-r; 
plot(y1(ramo3),x(ramo3),Color='#368C6E',LineWidth=1.2)
plot(x,y1,Color='#490080',LineStyle='-.')
plot(x,x,Color='#306800',LineStyle='--')
% plot x and y axis
xline(0);
yline(0);
set(gca,XAxisLocation='origin',YAxisLocation='origin') 
scatter(Wb*abs(Wb)^r,Wb,'k','filled',SizeData=14)
yaxisproperties=get(gca, 'YAxis');
yaxisproperties.TickLabelInterpreter = 'latex';   % tex for y-axis
yticks([Wb])
yticklabels({'$-\frac{r}{r+1}$'})
h=gca;
h.YRuler.TickLabelGapOffset = -30;
%if mod(abs(r),2)==0
%    yline(abs(r),LineStyle="--",Color="#ff1c22")
%else
%    yline(abs(r)+1,LineStyle="--",Color="#ff1c22")
%end
% set lim
ylim([-max(y1) max(y1)])
xlim([-max(y1) max(y1)])
% the when the
arrows
% set legend
legend({'$W_{r,0}(z)$','$W_{r,-1}(z)$','$W_{r,-2}(z)$','$W_{r}^{-1}(z)$'},Interpreter="latex",Location="southwest")
% set title
%t="$W_{r}(z)$ and its inverse on $r=-$"+abs(r)
%title(t,Interpreter="latex")
% save command
set(gca, Color="none"); % Sets axes background
export_fig("Wr_from_inverse_r=-"+abs(r)+".png",'-transparent', '-native')

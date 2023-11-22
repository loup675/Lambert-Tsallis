close all;
clear;
clc;
r=3; % r>0 integer
if mod(r,2)==0
    x0=-10*r/4;
    x1=3*r/4;
else
    x0=-10*r/4;
    x1=6*r/4;
end    
x=linspace(x0,x1,1000);
y=x.*(1+x./r).^r;
Wb=-r/(r+1);
ramo1=x>=Wb;
plot(y(ramo1),x(ramo1),Color='#FF350B',LineWidth=1.2)
hold on
ramo2=Wb>x & x>=-r;
plot(y(ramo2),x(ramo2),Color='#3F19FF',LineWidth=1.2)
ramo3=x<=-r;
plot(y(ramo3),x(ramo3),Color='#368C6E',LineWidth=1.2)
plot(x,y,Color='#490080',LineStyle='-.')
plot(x,x,Color='#306800',LineStyle='--')
% plot x and y axis
% xline(0)
% yline(0)
set(gca,XAxisLocation='origin',YAxisLocation='origin')
scatter(Wb*abs(Wb)^r,Wb,'k','filled',SizeData=14)
scatter(0,-r,'k','filled','SizeData',14)
yaxisproperties=get(gca, 'YAxis');
yaxisproperties.TickLabelInterpreter = 'latex';   % tex for y-axis
yticks([-r Wb])
yticklabels({'$-r$','$-\frac{r}{r+1}$'})
% set limits
if mod(r,2)==0
    ratio=1
    ylim([x0*ratio x1*ratio])
    xlim([x0*ratio x1*ratio])
else
    ratio=1
    ylim([(x0+2)*ratio (x1-1.5)*ratio])
    xlim([(x0+2)*ratio (x1-1.5)*ratio])
end
% the when the 
arrows
% set legend
legend({'$W_{r,0}(z)$','$W_{r,-1}(z)$','$W_{r,-2}(z)$','$W_{r}^{-1}(z)$'},Interpreter="latex",Location="southeast")
% set title
%t="$W_{r}(z)$ and its inverse on $r=$"+r
%title(t,Interpreter="latex")
% save command
set(gca, Color="none"); % Sets axes background
export_fig("Wr_from_inverse_r="+r+".png",'-transparent', '-native')

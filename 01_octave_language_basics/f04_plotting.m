disp("--- You are running 'f04_plotting' file now ---")

x = [0:0.01:20];       % suppress values printout with ';'
y1 = sin(x);
y2 = cos(x);


plot(x,y1)
hold on

plot(x,y2,'r')

xlabel('radians')
ylabel('value')
legend('sin','cos')
title('Demo plot')

print -dpng 'data/tmp/demo_plot.png'

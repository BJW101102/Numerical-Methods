% Brandon Walton
% CSC 2262
% Spring 2023
% Program #8A
format compact
clear,clc

c = .0016;
t = 0 : .001 : 15;
v0 = 0;
f = @(t,v) (3*t^2 + 6*t + 150 )/(sqrt(t^2+4*t+20)) - c*v^2;
options = odeset('AbsTol',1e-7,'RelTol',1e-7);
[t, v] = ode45(f, t, v0, options);
v = v*60/88;

%Plotting The Graph
plot(t,v,'b');
axis([0 15 2 120]);
set(gca,'xtick',0:15);
set(gca,'ytick',0:10:120);
xlabel('t');
ylabel('v');
title('Program 8a');

% Brandon Walton
% CSC 2262
% Spring 2023
% Program #8B
format compact
clear,clc

%Gathering points 
t = 0 : .001 : 70;
u0 = [1000 300 600];
options = odeset('RelTol',1e-7,'AbsTol',1e-7);
[t, u] = ode45(@f2, t, u0, options);

%Setting Graph
plot(t,u(:,1),'b',t,u(:,2),'g',t,u(:,3),'r');
axis([0 70 -100 1110])
set(gca,'xtick',0:10:70);
set(gca,'ytick',-100:100:1100);
xlabel('t');
ylabel('x(blue),y(green),z(red) Populations');
title('Program 8b');

% Expression Function
function expression = f2(t, uf)
A = .0012;
B = .011;
C = .0014;
D = .006;
E = .0004;
k = .45;

x = uf(1);
y=  uf(2);
z = uf(3);

expression = zeros(3,1);
expression(1) = x - A*(x^2) - A*k*x*y - B*x*z;
expression(2) = y - C*k*x*y - A*(y^2) - A*y*z;
expression(3) = -z + D*x*z + E*y*z;
end

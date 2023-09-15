% Brandon Walton
% CSC 2262
% Spring 2023
% Program #6
format compact
clear, clc

f = @(x) x.^3-(x.^2.*exp(-0.5.*x))-3.*x+1;
leftRange = -2;
rightRange = 3;
x = leftRange:0.01:rightRange;
fPlot = f(x);
xLine = [leftRange, rightRange];
yLine = [0,0];
plot(x, fPlot,'r',xLine,yLine, 'k');
x1 = fzero(f,-2);
x2 = fzero(f, 1);
x3 = fzero(f,4);
disp("Part 1")
fprintf('x = %.4f   x2 = %.4f   x3 = %.4f\n', x1, x2, x3)
disp(" ")

L1 = 5;
L2 = 8;
h = 1.5;
f = @(theta) L1.*cosd(theta)+sqrt(L2.^2-(L1.*sind(theta)-h.^2).^2) - 9;
leftRange = 0;
rightRange = 350;
theta = leftRange:0.01:rightRange;
fPlot = f(theta);
xLine = [leftRange, rightRange];
yLine = [0,0];
plot(theta, fPlot,'r',xLine,yLine, 'k');
t1 = fzero(f, 70);
t2 = fzero(f,350);
disp("Part 2")
fprintf('theta1 = %.4f   theta2 = %.4f', t1, t2)
disp(" ")







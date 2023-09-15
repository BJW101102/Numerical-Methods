% Brandon Walton
% CSC 2262
% Spring 2023
% Program #5
format compact
clear, clc

%Part 1 
disp("Part a")
a = 1;
b = 11;
f = @(x) ((x.^3).*exp(-0.2*x))./(1+x.^(2));
I = integral(f,a,b,'RelTol', 0, 'AbsTol', 1e-7);
fprintf('I = %.5f\n',I)
disp(" ")


%Part 2
disp("Part b")
a = 2; b = 4;
g = @(x) ((x.^(2)).*((x-2).^(3)))./((x.^(2))+(3.*x)+4);
h = @(x)(((x+1).^(2)) + 3)./ (1+(x-1).*(sin((pi/4).*(x-2))));
f = @(x,y) ((y.^(4)).*(log(x+y))./(x+(3*y)+2)) + (y.*log((y.^2).*sqrt(x+y.^(3))));
mass = integral2(f, a, b, g, h, 'RelTol', 0, 'AbsTol', 1e-7);
fprintf('mass = %.5f\n', mass);
disp(" ")


%Part 3
disp("Part c")
a = 2; b = 4;
g = @(x) (((x-2).^4) + (3.*x)+12) ./ (x+4);
h = @(x) 9 - sqrt(1+(x-2).^3);
v = @(x,y) 0*x + 8;
w = @(x,y) x + y + 2;
f = @(x,y,z) ((z.^(3)).*(cos(x+y+z)))./((2.*x)+(3.*z)+2) + (z.^(2)) .* log(y.*sqrt(z+y.^(3)));
mass = integral3(f, a, b, g, h, v, w, 'RelTol', 0, 'AbsTol', 1e-7);
fprintf('mass = %.5f\n', mass);





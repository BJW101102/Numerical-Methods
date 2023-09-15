% Brandon Walton
% CSC 2262
% Spring 2023
% Program #2

format compact
format bank
clear, clc

%Part 1 
disp("Part 1")
%L: loan Amount, n: fixed payment years, r: annual intrest rate
L = 100000; n = 30; r = 6/100;
aftYrs = [0:5:30]; %initliazing after years matrix
factor = (1 +(r/12)); %used var. factor to improve readabilty of code
loanBal = L .*((((factor)).^(12*n)) - ((factor).^(12.*aftYrs))) ./ (((factor)^(12*n)) - 1);
Table = [aftYrs;loanBal]
disp(" ")

%Part 2 
format short
disp("Part 2")
x = [.5:.5:2.5]; y = [0.8:.8:4]; %initliazing vectors x & y
disp("(a)")
z = (x.^2)+(2*(x.*y)) %(a)
disp("(b)")
z = ((x .*y) .* exp(y./x)) - (nthroot(((x.^4).*(y.^3)) + 8.5, 3)) %(b)
disp(" ")

%Part 3 
disp("Part 3")
t = [1:5]; x = [2:2:10]; y = [3:3:15]; %initliazing vectors t & r
r = 1.6e3; s = 14.2; %initliazing scalars
disp("(a)")
G = (x.*t) + (((r.*(y.^(2)-x)).*t) ./ (s.^(2)))%(a)
disp("(b)")
R = ((r.*((-x.*t)+((y.*t.^(2)))))./(15)) - (s.^(2)).*(y-(0.5.*x.^(2))).*t %(b)
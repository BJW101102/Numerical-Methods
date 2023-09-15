% Brandon Walton
% CSC 2262
% Spring 2023
% Program #3
format compact
clear, clc

%Assigning variables, Note: converting to radians
alpha = 44*pi/180;
beta = 69*pi/180;
gamma = 48*pi/180;
delta = 76*pi/180;
W = 330;
G = 410;
H = 260;

%Note: (x,y) -> (cos,sin) 
F1x = cos(alpha);
F1y = sin(alpha);
F2x = cos(beta);
F2y = sin(beta);
F3x = cos(gamma);
F3y = sin(gamma);
F4x = cos(delta);
F4y = sin(delta);

%Creating the equations into its own matrices
eqn1 = [F1x,0,0,0,0,1,0,1,0,0];
eqn2 = [F1y,0,0,0,0,0,0,0,1,0];
eqn3 = [0,-1*F2x,F3x,0,0,-1,1,0,0,0];
eqn4 = [0,F2y,F3y,0,0,0,0,0,0,0];
eqn5 = [0,0,0,-1*F4x,0,0,-1,0,0,0];
eqn6 = [0,0,0,F4y,0,0,0,0,0,1];
eqn7 = [-1*F1x,F2x,0,0,1,0,0,0,0,0];
eqn8 = [-1*F1y,-1*F2y,0,0,0,0,0,0,0,0];
eqn9 = [0,0,-1*F3x,F4x,-1,0,0,0,0,0];
eqn10 = [0,0,-F3y,-1*F4y,0,0,0,0,0,0];

A = [eqn1;eqn2;eqn3;eqn4;eqn5;eqn6;eqn7;eqn8;eqn9;eqn10];
B = [0;0;0;W;0;0;0;G;H;0];

F = A\B



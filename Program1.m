% Brandon Walton
% CSC 2262
% Spring 2023
% Program #1

format compact
clear, clc

%Part 1
%Assigning the L,W,H and finding its corresponding sides
L = 16; W = 43; H = 23;
sideA = sqrt(L^2+W^2);
sideB = sqrt(L^2+H^2);
sideC = sqrt(W^2+H^2);

%Finding the Angle, Note: p1/p2/p3 are used to simply the equation
p1 = (sideB^2)/(2*sideA*sideC);
p2 = sideA /( 2*sideC);
p3 = sideC / (2*sideA);
disp("Part 1")
AngleABC = acosd(-p1 + p2 + p3)

%Finding the Area
p = (sideA + sideB + sideC)/2;
A = sqrt(p*((p-sideA)*(p-sideB)*(p-sideC)))
disp(" ")

%Part 2 Finding the arc, Note: q1/q2 are used to simply the equation
a = 8; h = 13;
q1 = (a^2)/(2*h);
q2 = (2*h)/a;
disp("Part 2")
L = sqrt(a^2+(4*(h^2))) + q1*log(q2+sqrt(q2^2 + 1))
disp(" ")

% Part 3 Finding Angles, Note: g1/g2/g3 are used to simply the equation
r1 = 15; r2 = 10.5; r3 = 4.5;
sideA2 = r2 + r3;
sideB2 = r1 + r3;
sideC2 = r1 + r2;

g1 = (sideC2^2)/(2*sideA2*sideB2);
g2 = sideA2 /( 2*sideB2);
g3 = sideB2 / (2*sideA2);

% Note: For the law of Sins: I converted a/sin(alp) to a*csc(Alp). So:
% 1/sin(x) = csc(x)
disp("Part 3")
Gam = acosd(-g1 + g2 + g3)
Bet = acscd(sideC2*(cscd(Gam))/sideB2)
Alp = acscd(sideC2*(cscd(Gam))/sideA2)
SumAng = Gam + Bet + Alp
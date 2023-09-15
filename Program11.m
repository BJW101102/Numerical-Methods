% Brandon Walton 
% CSC 2262 
% Spring 2023
% Program 11

format compact
clear, clc 

%Assigning Contants 
m1 = .4; k1 = 3.9; c1 = .16;
m2 = .9; k2 = 5.2; c2 = .36;
m3 = .7; k3 = 4.2; c3 = .28;
m4 = .8; k4 = 4.7; c4 = .14;
m5 = .6; k5 = 5.3; c5 = .32;
m6 = .5; k6 = 4.9; c6 = .24;
m7 = .3; k7 = 4.4; c7 = .12;
         k8 = 5.4; c8 = .20;


%Setting Up Matrices
v = [0,0,0,0,0,0,0];
A11 = diag(v); % Equivalent to  a 7x7 Matrix filled with 0's
A12 = eye(7); % Equivalent to a 7x7 identity matrix (Diag 1's)

A21 = [ -(k1+k2)/m1   k2/m1        0              0            0            0           0
        k2/m2         -(k2+k3)/m2  k3/m2          0            0            0           0
        0             k3/m3        -(k3+k4)/m3    k4/m3        0            0           0
        0             0            k4/m4          -(k4+k5)/m4  k5/m4        0           0
        0             0            0              k5/m5        -(k5+k6)/m5  k6/m5       0
        0             0            0              0            k6/m6        -(k6+k7)/m6 k7/m6
        0             0            0              0            0             k7/m7      -(k7+k8)/m7];

A22 = [ -(c1+c2)/m1   c2/m1        0              0            0            0           0
        c2/m2         -(c2+c3)/m2  c3/m2          0            0            0           0
        0             c3/m3        -(c3+c4)/m3    c4/m3        0            0           0
        0             0            c4/m4          -(c4+c5)/m4  c5/m4        0           0
        0             0            0              c5/m5        -(c5+c6)/m5  c6/m5       0
        0             0            0              0            c6/m6        -(c6+c7)/m6 c7/m6
        0             0            0              0            0             c7/m7      -(c7+c8)/m7];
A = [A11 A12; A21 A22];
[eigvec, eigval] = eig(A);


%Seeting Up Graph
t = [0: 0.001: 16];
lineX = [0 16];
lineY = [0 0];
titles(1, :) = 'Program 10 Figure 1';
titles(2, :) = 'Program 10 Figure 2';
titles(3, :) = 'Program 10 Figure 3';
titles(4, :) = 'Program 10 Figure 4';
titles(5, :) = 'Program 10 Figure 5';
titles(6, :) = 'Program 10 Figure 6';
titles(7, :) = 'Program 10 Figure 7';
n = 0;


%Plotting Points
for k = 13 : -2 : 1
    n = n + 1;

    alpha = real( eigval(k,k) );
    beta = imag( eigval(k,k) );
    gamma = sqrt( alpha^2 + beta^2 );
    delta = -(alpha/gamma);
    w = gamma * sqrt( 1 - delta^2 );

    a1 = real(eigvec(1,k));
    b1 = imag(eigvec(1,k));

    a2 = real(eigvec(2,k));
    b2 = imag(eigvec(2,k));

    a3 = real(eigvec(3,k));
    b3 = imag(eigvec(3,k));

    a4 = real(eigvec(4,k));
    b4 = imag(eigvec(4,k));

    a5 = real(eigvec(5,k));
    b5 = imag(eigvec(5,k));

    a6 = real(eigvec(6,k));
    b6 = imag(eigvec(6,k));

    a7 = real(eigvec(7,k));
    b7 = imag(eigvec(7,k));
        
    x1 = 2 * exp(alpha*t) .* (a1*cos(w*t) + b1*sin(w*t));
    x2 = 2 * exp(alpha*t) .* (a2*cos(w*t) + b2*sin(w*t));
    x3 = 2 * exp(alpha*t) .* (a3*cos(w*t) + b3*sin(w*t));
    x4 = 2 * exp(alpha*t) .* (a4*cos(w*t) + b4*sin(w*t));
    x5 = 2 * exp(alpha*t) .* (a5*cos(w*t) + b5*sin(w*t));
    x6 = 2 * exp(alpha*t) .* (a6*cos(w*t) + b6*sin(w*t));
    x7 = 2 * exp(alpha*t) .* (a7*cos(w*t) + b7*sin(w*t));

    %Plotting On Graph
    figure(n);
    plot(t,x1,'b',t,x2,'r',t,x3,'g',t,x4,'k',t,x5,'c',t,x6,'y',t,x7,'m',lineX,lineY,'k');
    axis([0 16 -0.7 0.7]);
    set(gca,'xtick',0:2:16);
    set(gca,'ytick', -0.7:.1:0.7);
    xlabel('t');
    ylabel('x1(b), x2(r), x3(g), x4(b), x5(c), x6(y),x7(m)');
    title(titles(n,:));
end
%Brandon Walton
% CSC 2262 
% Spring 2023
% Program 10

format compact
clear, clc 

%Assigning Constants 
m1 = .4; k1 = 3.9;
m2 = .9; k2 = 5.2;
m3 = .7; k3 = 4.2;
m4 = .8; k4 = 4.7;
m5 = .6; k5 = 5.3;
m6 = .5; k6 = 4.9;
m7 = .3; k7 = 4.4;
k8 = 5.4;

%Declaring Matrix
A = [ -(k1+k2)/m1   k2/m1        0              0            0            0           0
      k2/m2         -(k2+k3)/m2  k3/m2          0            0            0           0
      0             k3/m3        -(k3+k4)/m3    k4/m3        0            0           0
      0             0            k4/m4          -(k4+k5)/m4  k5/m4        0           0
      0             0            0              k5/m5        -(k5+k6)/m5  k6/m5       0
      0             0            0              0            k6/m6        -(k6+k7)/m6 k7/m6
      0             0            0              0            0             k7/m7      -(k7+k8)/m7];
A = -A;
[eigvec, eigval] = eig(A);

%Configuring Graph
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

%Iterative loop for each figure
for k = 1:7
    w = sqrt(eigval(k,k));
    wt = w*t;
    c1 = eigvec(1, k);
    c2 = eigvec(2, k);
    c3 = eigvec(3, k);
    c4 = eigvec(4, k);
    c5 = eigvec(5, k);
    c6 = eigvec(6, k);
    c7 = eigvec(7, k);
    x1 = c1*cos(wt);
    x2 = c2*cos(wt);
    x3 = c3*cos(wt);
    x4 = c4*cos(wt);
    x5 = c5*cos(wt);
    x6 = c6*cos(wt);
    x7 = c7*cos(wt);
    figure(k);
    plot(t,x1,'b',t,x2,'r',t,x3,'g',t,x4,'k',t,x5,'c',t,x6,'y',t,x7,'m',lineX,lineY,'k');
    axis([0 16 -1 1]);
    set(gca,'xtick',0:2:16);
    set(gca,'ytick', -1:.2:1);
    xlabel('t');
    ylabel('x1(b), x2(r), x3(g), x4(k), x5(c), x6(y),x7(m)');
    title(titles(k,:));
end
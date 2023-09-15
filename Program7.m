% Brandon Walton
% CSC 2262
% Spring 2023
% Program #7
format compact
clear,clc

%Given Constants 
R1 = 4.14;
R2 = 3.26;
R3 = 3.77;
R4 = 2.57;

%Initial Guesses & Partial Derivatives
g1 = (75*pi)/180;
g2 = (30*pi)/180;
df1dt2 = @(t2,t3) -(R2*sin(t2));
df1dt3 = @(t2,t3) -(R3*sin(t3));
df2dt2 = @(t2,t3) -(R2*cos(t2));
df2dt3 = @(t2,t3) R3*cos(t3);

acc = 1e-7;
n=0;

%Looping through vales of t4
for t4 = (85*pi)/180:(1*pi)/180:(805*pi)/180

    %Functions
    f1 = @(t2,t3) (R2*cos(t2))+(R3*cos(t3))+(R4*cos(t4))-R1;
    f2 = @(t2,t3) (R3*sin(t3))+(R4*sin(t4))-(R2*sin(t2));

    %Newtwon Function Call
    [t2, t3] = newton2(f1,f2,df1dt2,df1dt3,df2dt2,df2dt3,g1,g2,acc);

    %Calculateing posistions of the four bar linkage
    R1x = R1;
    R1y = 0;
    R2x = R2*cos(t2);
    R3x = R3*cos(t3);
    R4x = R4*cos(t4);
    R2y = R2*sin(t2);
    R3y = R3*sin(t3);
    R4y = R4*sin(t4);
    x1 = [0, R1x];
    y1 = [R1y, R1y];
    x2 = [0, R2x];
    y2 = [0, R2y];
    x3 = [R2x, R2x+R3x];
    y3 = [R2y, R4y];
    x4 = [R2x+R3x, R1];
    y4 = [R4y, 0];

    %Plotting points for the four bar linkage
    plot(x1,y1,'black',x2,y2, 'red',x3, y3,'green',x4,y4,'blue');
    axis([-3 7 -3 7]);
    set(gca,'xtick',-3:1:7);
    set(gca,'ytick',-3:1:7);
    pbaspect([1 1 1]);
    xlabel('x');
    ylabel('y');
    title('Program 7');
    pause(.01);
    if(n == 1)
        pause(7);
    end
end

%Newton-Raphson function
function [t1,t2]=newton2(f1,f2,df1dt1,df1dt2,df2dt1,df2dt2,g1,g2,acc)
t1New = g1;
t2New = g2;
t1Old = g1 + 1;
t2Old = g2 + 1;
while abs(t1New-t1Old)>=acc || abs(t2New-t2Old)>=acc
    t1Old=t1New;
    t2Old=t2New;
    A = [df1dt1(t1Old,t2Old), df1dt2(t1Old,t2Old)
         df2dt1(t1Old,t2Old), df2dt2(t1Old,t2Old)];
    B = [f1(t1Old,t2Old)
         f2(t1Old,t2Old)];
    C = A\B;
    t1New = t1Old - C(1);
    t2New = t2Old - C(2);
end
t1 = t1New;
t2 = t2New;
end
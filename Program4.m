% Brandon Walton
% CSC 2262
% Spring 2023
% Program #4
format compact
clear, clc

%Part 1
for (a = 1: 1: 30) %a will also be used to index throught the matrix
    for (b = 1: 1: 30)
        for (c = 1: 1: 30)
            if ((a^2 + b^2) == c^2 && a < b)
                A(a,1) = a;
                A(a, 2) = b;
                A(a, 3) = c;
            end
        end
    end
end

A( all(~A,2), : ) = []; %Used to delete all 0 rows
disp("Part 1")
PythagoreanTriples = A
disp(" ")

%Part 2
for (i = 1: 1: 100) %i will also be used to index throught the matrix
    if(isprime(i) && isprime(i + 6) && i + 6 < 100)
        B(i,1) = i;
        B(i, 2) = i + 6;
    end
end

B( all(~B,2), : ) = []; %Used to delete all 0 rows
disp("Part 2")
Diff6Primes = B
disp(" ")

%Part 3
C = [];
for (num = 2: 1: 10000)
    sum = 0;
    for (j = 1: 1: floor(num/2))
        if (rem(num,j) == 0)
            sum = sum + j;
        end
    end
    if (sum == num)
        C = [C, num];
    end
    if length(C) == 3
        break
    end
end
disp("Part 3")
PerfectNumbers = C









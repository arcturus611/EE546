% GRADIENT DESCENT ALGORITHM 
% This example illustrates the dependence of gradient descent on the
% starting point. When we start at a point on the longer end, it takes
% about 100 iterations. When we start at a point on the shorter end, it
% takes about 10 iterations. An order of magnitude difference!
% This example is from slide 1-4 of vandenberghe's lecture 236c,
% gradient.pdf.

clc; clearvars; close all; 

% generate the problem data
num_points = 200;
x1 = linspace(-10, 10, num_points);
x2 = linspace(-4, 4, num_points); 
x2 = x2';
gamma = 8;

[x1m, x2m] = meshgrid(x1, x2); 
data = 0.5*(x1m.^2 + gamma*x2m.^2);

figure, contour(x1m, x2m, data);

% initialize gradient descent
x0 = [0, -3]; 
step_size = 0.1;
delta = 1;
epsilon = 10^(-5);
k = 1;
x(k, :) = x0;

% repeat iterations
hold on;
while(delta>epsilon)
    plot(x(k, 1), x(k, 2), 'rx');
    
    grad = [x(k, 1) x(k, 2)*gamma];
    
    x(k + 1, :) = x(k, :) - step_size*grad;
    
    delta = norm(x(k + 1, :) - x(k, :), 2);
        
    k = k + 1;
end

sprintf('Number of iterations for convergence when starting at (%d, %d) is %d', x0(1), x0(2), k)



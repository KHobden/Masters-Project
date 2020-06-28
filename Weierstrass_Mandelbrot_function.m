%Weierstrass-Mandelbrot Function
%Kieran Hobden
%22-Jun-'20

%The Weierstrass-Mandelbrot function is given in:
%https://royalsocietypublishing.org/doi/pdf/10.1098/rspa.1980.0044
%(Univariate)
%https://royalsocietypublishing.org/doi/pdf/10.1098/rspa.1985.0083
%(Multivariate)

%We set phi to be a uniformly distributed number in the range [0,2*pi]
%so the WM function is now a Gaussian function

%D=1 recovers the convergent series
%D=1.5 recovers the 'Brownian' fractal
%D->2 recovers the 'extreme' fractal

tic
%Define constants
gamma = 1.5;
D = 1.8; %Hausdorff-Besicovitch (fractal) dimension
nmin = -100; nmax = 1500; %Range of sum
Nx = 10000; %No. x increments in range [0,1]

%Generate the set {phi_n} of uniformly distributed random numbers
rng('default')
phi = 2*pi*rand(nmax-nmin+1,1);

%Initialise arrays and evaluate WM function
x = linspace(0,1,Nx);
n(:,1) = nmin:nmax;
summand = gamma.^(-n*(2-D)).*(cos(phi)-cos((gamma.^n).*x+phi));
WMF = sum(summand);

%Plot WM function
figure('Name','Weierstrass-Mandelbrot Function','NumberTitle','off');
plot(x,WMF);
mytitleText = ['Sum from n=', num2str(nmin), ' to n=', num2str(nmax), ...
    ' with \gamma=', num2str(gamma), ' and D=', num2str(D)];
title(mytitleText);
toc
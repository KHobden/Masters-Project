%Weierstrass function
%Kieran Hobden
%19-Jun-'20

%Plot the original Weierstrass function as given in:
%https://scholar.rose-hulman.edu/cgi/viewcontent.cgi?article=1217&context=rhumj

tic
%Define constants
lambda = 1.8;
s = 1.2; %Hausdorff-Besicovitch (fractal) dimension
kmax = 200; %Upper limit of sum
Nx = 10000; %No. x increments in range [0,1]

%Initialise arrays and evaluate Weierstrass function
x = linspace(0,1,Nx);
k(:,1) = 1:kmax;
summand = lambda.^((s-2)*k).*sin((lambda.^k).*x);
WF = sum(summand);

%Plot WM function
figure('Name','Weierstrass Function','NumberTitle','off');
plot(x,WF);
mytitleText = ['First ', num2str(kmax), ' terms, with \lambda=', ...
    num2str(lambda), ' and s=', num2str(s)];
title(mytitleText);
toc
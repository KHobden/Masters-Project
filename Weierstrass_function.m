%Weierstrass function
%Kieran Hobden
%19-Jun-'20

%% Plot the original Weierstrass function

tic
%Define constants
lambda = 1.8;
s = 1.2;
kmax = 200;
N = 500;

%Evaluate function
x = linspace(0,1,N);
summand = zeros(kmax,N);
for k = 1:kmax
    summand(k,:) = lambda^((s-2)*k)*sin((lambda^k)*x);
end
WMF = sum(summand);

%Plot WM function
figure('Name','Weierstrass Function','NumberTitle','off');
plot(x,WMF);
mytitleText = ['First ', num2str(kmax), ' terms, with \lambda=', ...
    num2str(lambda), ' and s=', num2str(s)];
title(mytitleText);
toc
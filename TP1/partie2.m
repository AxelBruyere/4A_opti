clc;clear variables;close all;

%Déclaration des variables
x = -100:0.01:100;
f = @(x) x.^2;
f_prime = @(x) 2.*x;
tk = 0.01;

%Mise en place de la méthode de la descente du gradient
[x0,fx0] = descente_gradient_1D(x,f,f_prime,tk);

%Interface graphique
figure(1)
hold on
plot(x,f(x),'DisplayName','f(x)')
point = plot(x0,fx0,'*r','DisplayName','Minimum trouvé')
axis tight
xlabel('x')
ylabel('f(x)')
title('Minimum trouvé par la méthode de descente du gradient')


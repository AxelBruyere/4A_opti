clc; close all; clear variables;

%Dimension du vecteur x
N = 3;

%Création des variables x, z, H, Gamma et lambda
x = reshape(randn(N),N^2,1);
H = matH(size(x),'gaussian',N);
z = reshape(randn(N),N^2,1);
lambda = 2;
gamma = matGamma(size(x),'identity');

%Implémentation de la fonction à minimiser ainsi que de son gradient
x_chap = @(x) (norm(H*x - z)).^2 + lambda * (norm(gamma*x)).^2;
x_chap_prime = @(x) 2*(H'*(H*x-z) + lambda*(gamma'*gamma)*x);

%Appel à la méthode de descente du gradient
[xk,fk] = descente_gradient_ND(x_chap,x_chap_prime,0.01,10000,N);

xk_th = inv(H'*H+lambda*gamma'*gamma)*H'*z;


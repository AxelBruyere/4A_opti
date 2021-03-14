%% Résolution du modèle de Tikhonov 1D
% f(x) = L(Hx;z) + lambda*R(x)

clear all;
close all;

%% x = argmin|Hx-z| + lambda*|Gamma*x|

N=5;
X = randn([N 1]);
Z = randn([N 1]);
G = matGamma(size(X),'identity');
H = matH(size(X), 'uniform', N);
lambda = 1;
f = @(x) norm(H*x-Z).^2 + lambda*norm(G*x).^2;
grad = @(x)  2*(H'*(H*x-Z)+ lambda*(G'*G)*x);

k = 0;
pas = 0.3;
aim = 1.0e-06;
max_it = 10000;
while (norm(grad(X))>aim && k<max_it)
    X= X - pas*grad(X);
    k = k + 1;
end

x_chap = inv(H'*H + lambda*G'*G)*H'*Z;
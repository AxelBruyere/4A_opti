%% Résolution du modèle de Tikhonov 2D
% f(x) = L(Hx;z) + lambda*R(x)

clear all;
close all;

%% x = argmin|Hx-z| + lambda*|Gamma*x|
im = im2double(imread('cameraman.tif'));
[M,N] = size(im);

X = randn(size(im));
Z = im;
G = matGamma(size(X),'identity');
H = matH(size(X), 'uniform', 5);
lambda = 1;
f = @(x) norm(H*x-Z(:)).^2 + lambda*norm(G*x).^2;
grad = @(x)  2*(H'*(H*x-Z(:))+ lambda*(G'*G)*x);

k = 0;
pas = 0.3;
aim = 1.0e-04;
max_it = 10000;

while (norm(grad(X(:)))>aim && k<max_it)
    X(:) = X(:) - pas*grad(X(:));
    k = k + 1;
end

x_chap = inv(H'*H + lambda*G'*G)*H'*Z(:);


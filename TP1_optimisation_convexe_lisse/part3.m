%% Résolution du modèle des moindres carrés
% f(x) = L(Hx;z)  (R(x)=0 ici)

clear all;
close all;
clc;
%% x = argmin|Hx-z|

%Image perroquet
I = im2double(imread('cameraman.tif'));
Z = I(:);


X = randn(size(I));
% Z = randn([N 1]);


H = matH(size(I), 'gaussian', 3);
f = @(x) norm(H.*x-Z).^2;
grad = @(x) 2*H'*(H*x-Z);



k = 0;
pas = 0.7;
aim = 1.0e-06;
max_it = 10;

while (norm(grad(X(:)))>aim && k<max_it)
    X(:) = X(:) - pas*grad(X(:));
    k = k + 1;
    pause
end

% x_chap = inv(H'*H)*H'*Z;
% Ifinal = reshape(X,size(I));
% 
% %Affichage
% figure(1)
% subplot(121)
% imshow(RGB)
% subplot(122)
% imshow(Ifinal)



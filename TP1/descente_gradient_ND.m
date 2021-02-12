function [xk,fk] = descente_gradient_ND(f,f_grad,pas,nb_iter,N)
%Entrées : 
%   -f : Fonction à minimiser
%   -f_grad : Gradient de la fonction à minimiser
%   -pas : Pas souhaité pour la méthode de descente du gradient
%   -nb_iter : Nombre maximum d'itérations souhaité
%   -N : Dimension de l'image d'origine

%Sorties : 
%   -xk : argmin(f) trouvé
%   -fk : f(x) correspondant pour le x trouvé

%Sélection au hasard d'un x de départ de notre algorithme
[a,b] = size(f);
xk = floor((b-a).*randn(N^2,1) + a);
%Compteur d'itérations pour limiter les boucles infinies
k = 0;

%Tant que l'on a pas effectué le max d'itération demandé et que la norme du
%gradient est supérieure à la valeur demandée
while (norm(f_grad(xk)) > 0.0001 && k < nb_iter)
    xk = xk - (pas * f_grad(xk)) ;
    k = k + 1;
end

%Affichage console du x trouvé et de f(x)
k
fk = f(xk)
end
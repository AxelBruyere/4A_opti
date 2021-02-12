function [xk,fx0] = descente_gradient_1D(x,f,f_prime,tk)
    %Ceci est la fonction qui permet de trouver un minimum par la méthode
    %de descente du gradient
    t = 1;
    
    %Sélection au hasard d'un x de départ de notre algorithme
    [a,b] = size(f);
    xk = floor((b-a).*rand(1,1) + a);
    
    %xk+1 = xk + tk * df(xk)
    while abs(f_prime(xk)) > 0.01
            xk = xk - (tk * f_prime(xk))
    end
    
    %On renvoie aussi la valeur de f afin de vérifier le bon fonctionnement
    %de notre algo
    fx0 = f(xk);
end
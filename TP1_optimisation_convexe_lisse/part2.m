clear all;
close all;

%% Prise en main (D=R^N)

f = @(x) norm(x).^2;
df = @(x) 2*norm(x);
N=5;
%X=1000*randn([N 1]);

%Image perroquet
I = im2double(rgb2gray(imread('parrot.tif')));
X = I(:);

%Suite x_k
k = 0;
pas = 0.4;
aim = 1.0e-06;
max_it = 10000;

while (abs(df(X))>aim && k<max_it)
    
    X= X - 2*pas*X;
    k = k + 1;
end
Ifinal = reshape(X,size(I));

%Affichage
figure(1)
subplot(121)
imshow(I)
subplot(122)
imshow(Ifinal)



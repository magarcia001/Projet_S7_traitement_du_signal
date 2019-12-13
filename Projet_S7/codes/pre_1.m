%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

N = 1000;
sigma = 1;


%% Génération bruit blanc gaussien centré

nb = randn(1,N)*sigma;

%% Calcul autocorrélation et estimateurs

Rtheo = xcorr(nb);

Rbiased = xcorr(nb, 'biased');

Runbiased = xcorr(nb, 'unbiased');

%% Calcul spectre et densité spectrale de puissance

SP = fftshift(abs(fft(nb)).^2/N);

DSP = pwelch(nb,100);

%% Affichage

subplot(4,1,1)
plot(Rtheo)
title('Theorique')

subplot(4,1,2)
plot(Rbiased)
title('Biased')


subplot(4,1,3)
plot(Runbiased)
title('Unbiased')

subplot(4,1,4)
plot(SP)
title('Spectre de puissance')

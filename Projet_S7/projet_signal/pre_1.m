%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

N = 10000;
sigma = 1;


%% Génération bruit blanc gaussien centré

nb = randn(1,N)*sigma;

%% Calcul autocorrélation et estimateurs

Rtheo = xcorr(nb);

Rbiased = xcorr(nb, 'biased');

Runbiased = xcorr(nb, 'unbiased');

%% Calcul spectre et densité spectrale de puissance

SP = fftshift(abs(fft(nb,N)).^2/N);

DSP = fftshift(abs(fft(Rtheo,N)));

Daniell = pwelch(nb,100,99); % à modifier

Bartlett = pwelch(nb,100,0);

Welch = pwelch(nb,100);

%% Affichage

figure,
subplot(3,1,1)
plot(Rtheo)
title('Theorique')

subplot(3,1,2)
plot(Rbiased)
title('Biased')

subplot(3,1,3)
plot(Runbiased)
title('Unbiased')


figure,
subplot(5,1,1)
plot(SP)
title('Spectre de puissance')

subplot(5,1,2)
plot(DSP)
title('Densité spectrale de puissance')

subplot(5,1,3)
plot(Daniell)
title('Périodogramme de Daniell')

subplot(5,1,4)
plot(Bartlett)
title('Périodogramme de Bartlett')

subplot(5,1,5)
plot(Welch)
title('Périodogramme de Welch')

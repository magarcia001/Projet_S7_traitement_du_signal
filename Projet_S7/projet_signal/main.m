%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

load('fcno03fz.mat');
s = fcno03fz';
RSB = 5;
N = length(s);
fech = 8000;

%% Ajout du bruit

[s_bruit sigma] = bruit_rsb(s, RSB, N);

%% Découpage trame et fenêtrage

trames = dec_fen_trame(s_bruit,0.3);

%% Réhaussement trame par trame

trames_rehaus= rehaussement(trames, sigma);

%% Reconstruction signal par addition recouvrement

s_reconstruit = reconstruction(trames_rehaus);

%% Affichage

figure,
subplot(3,1,1)
plot(s)
title('Représentation temporelle du signal')



subplot(3,1,2)
plot(s_bruit)
title('Représentation temporelle du signal bruité')


subplot(3,1,3)
plot(s_reconstruit)
title('Représentation temporelle du signal reconstruit')


figure,
subplot(3,1,1)
spectrogram(s,100,0,2048,fech,'yaxis')
title('Spectrogramme du signal initial')



subplot(3,1,2)
spectrogram(s_bruit,100,0,2048,fech,'yaxis')
title('Spectrogramme du signal bruité')


subplot(3,1,3)
spectrogram(s_reconstruit,100,0,2048,fech,'yaxis')
title('Spectrogramme du signal réhaussé')



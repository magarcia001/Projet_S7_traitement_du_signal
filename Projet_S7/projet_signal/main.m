%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

load('fcno03fz.mat');
s = fcno03fz';
RSB = 5;
N = length(s);

%% Ajout du bruit

[s_bruit sigma] = bruit_rsb( s,RSB, N);

%% Découpage trame et fenêtrage

trames = dec_fen_trame(s_bruit,0.3);

%% Réhaussement trame par trame

trames_rehaus= rehaussement(trames,sigma);

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
soundsc(s_reconstruit);
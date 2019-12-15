%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

load('fcno03fz.mat');
s = fcno03fz;

%% Découpage trame et fenêtrage

trames = dec_fen_trame(s,0.3);

%% Reconstruction signal par addition recouvrement

s_reconstruit = reconstruction(trames);

%% Affichage

figure,
subplot(2,1,1)
plot(s)
title('Représentation temporelle du signal')

subplot(2,1,2)
plot(s_reconstruit)
title('Représentation temporelle du signal reconstruit')
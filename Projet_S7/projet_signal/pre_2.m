%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

load('fcno03fz.mat');

fech = 8000;
s = fcno03fz';
RSB = 5;
N = length(s);

%% Ajout du bruit

s_bruit = bruit_rsb( s,RSB, N);

%% Affichage

figure,
subplot(2,1,1)
plot(s)
title('Représentation temporelle du signal')

subplot(2,1,2)
spectrogram(s,100,0,2048,fech,'yaxis')
title('Spectrogramme du signal')

figure,
subplot(2,1,1)
plot(s_bruit)
title('Représentation temporelle du signal bruité')

subplot(2,1,2)
spectrogram(s_bruit,100,0,2048,fech,'yaxis')
title('Spectrogramme du signal bruité')

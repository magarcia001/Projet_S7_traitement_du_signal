%% GARCIA GODOY

clear all; close all;clc;

%% Initialisation des variables

load('fcno03fz.mat');
load('fcno04fz.mat');
y1 = fcno03fz;
y2 = fcno04fz;

sigma = 0;


%% Ajout bruit blanc gaussien centré

yb = y1 +randn(length(y1),1)*sigma;
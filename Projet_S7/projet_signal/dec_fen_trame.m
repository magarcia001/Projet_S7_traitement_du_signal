function [mat_trame, fenetre] = dec_fen_trame(signal, duree)

%% Initialisation des variables

Nech = length(signal);          % nombre d'echantillons dans le signal
fech = 8000;
N_ech_trame = round(duree*fech);       % nombre d'échantillons par trame
recouvrement = 50/100;          % recouvrement de 50%
d = recouvrement*N_ech_trame;   % longueur du recouvrement en nombre d'échantillons
Nb_trame = round(Nech/d-1);            % nombre totale de trames nécessaires

%% Découpage

mat_trame=zeros(Nb_trame,N_ech_trame); % chaque trame est dans une ligne
fenetre=hanning(N_ech_trame)'; % on utilise ici une fenêtre de hanning

for i=0:Nb_trame-1
    mat_trame(i+1,:)=signal((i/2)*N_ech_trame+1:(i/2)*N_ech_trame+N_ech_trame); % on remplit la matrice ligne par ligne
    mat_trame(i+1,:)=mat_trame(i+1,:).*fenetre; % on réalise le fenêtrage
end

end

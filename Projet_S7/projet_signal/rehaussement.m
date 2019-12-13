function [trames_rehaus] = rehaussement(trames,sigma)
     [nb_trames trame_len] = size(trames);
     K = 100;
     trames_rehaus = [];
    
     for i=1:nb_trames
         trame = trames(i,:);
         Hy = hankel(trame);
         
         [U S V] = svds(Hy, K,sigma);
         % Estimation au sens des moindres carrés
         Hs_ls = U*S*V';
         trame_rehaus = moy_antidiagonal(Hs_ls);
         
         trames_rehaus = [trames_rehaus; trame_rehaus];
     end
end
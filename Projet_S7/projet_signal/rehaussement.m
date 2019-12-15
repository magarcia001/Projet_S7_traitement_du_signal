function [trames_rehaus] = rehaussement(trames, sigma)

    [nb_trames trame_len] = size(trames);
    L = round(2/3*trame_len);
    M = trame_len+1-L;
    trames_rehaus = [];
    
    for i=1:nb_trames
         trame = trames(i,:);
         Hy = hankel(trame(1:L),trame(L:trame_len));
         [U S V] = svd(Hy);
         
         compteur =1 ;
         seuil = sigma^2/sqrt(L);
         [a b]  =size(S);
         while compteur<=b && S(compteur,compteur)>=seuil
            compteur=compteur+1;
         end
         K = compteur - 1;
%          K = 250;
         
         Ss = S(1:K,1:K);
         Us = U(:,1:K);
         Vs = V(:,1:K);
         Hs_ls = Us*Ss*Vs';
         
         trame_rehaus = moy_antidiagonal(Hs_ls, L, M);
         
         trames_rehaus = [trames_rehaus; trame_rehaus];
    end
end
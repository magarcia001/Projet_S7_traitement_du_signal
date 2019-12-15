function [moy_vect] = moy_antidiagonal(mat, L, M)
    mat=fliplr(mat);
    for k=-(L-1):M-1
        temp(k+L)=mean(diag(mat,k));
    end
    moy_vect = fliplr(temp);
end
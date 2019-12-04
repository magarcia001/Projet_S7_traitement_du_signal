function [moy_vect] = moy_antidiagonal(M)
    [h,w] = size(M);
    moy_vect=[];
    for i=1:h
        m = 0;
        for k=0:i-1
            m = m+ M(1+k,i-k);
        end
        m= m/i;
        moy_vect = [moy_vect m];
    end
    
    for j=2:w
        m=0;
        for l=0:w-j
            m = m+ M(h-l,j+l);
        end
        m= m/i;
        moy_vect = [moy_vect m];
    end
        
end
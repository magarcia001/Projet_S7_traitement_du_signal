function [signal_reconstruit] = reconstruction(trames)

    [nb_trames trame_len] = size(trames);
    milieu = floor(trame_len/2);
    signal_reconstruit = [];
    for i=1:nb_trames-1
        trame_i1 = trames(i,:);
        trame_i2 = trames(i+1,:);
        signal_reconstruit = [signal_reconstruit trame_i1(milieu+1:trame_len)+trame_i2(1:milieu)];
    end
end
% X: individuo

% Return
% DiffLIwithTP: Diferencia entre el ultimo tacho y tiempo maximo de una
%               corrida

function [DiffLIwithTP] = DiffTime(X)
    DiffLIwithTP = 100 - (max(X) - min(X));
end


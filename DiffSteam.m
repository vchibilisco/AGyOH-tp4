% SteamByMin: vector con los consumos de en una corrida

% Return
% MinimizedSteam: diferencia entre el mayor consumo y el menor

function [DiffMaxMin] = DiffSteam(SteamByMin)
    DiffMaxMin = 0;
    maxS = 0;
    minS = 0;
    maxS = max(SteamByMin);
    minS = min(SteamByMin(1,30 : end-30));
    DiffMaxMin = 100 - ( maxS - minS );
end


% individual: Individuo a evaluar
% tInH: Tiempo en hs
% ArrayHours: Contiene el tiempo donde fue posible procesar el consumo
%             vapor
% ArrayVapors: Contiene el vapor en determinado tiempo

% Return
% SteamTotal: Vapor total consumido por el individuo en determinado
%             instante de tiempo
% ArrayHours
% ArrayVapors

function [SteamTotal, ArrayHours, ArraySteam] = GetSteamTotalByIndividual(individual, tInH, ArrayHours, ArraySteam)
    CalcSteam = @(t,t0) 1-(2*(t-t0)-1)^2;

    SteamTotal = 0;

    for i = 1:size(individual,2)
        t0InH = individual(i)/60;
        t1InH = (individual(i) + 60)/60;
        if(tInH >= t0InH && tInH <= t1InH)
            vap = CalcSteam(tInH, t0InH);
            SteamTotal = SteamTotal + vap;
            ArrayHours = [ArrayHours tInH];
            ArraySteam = [ArraySteam vap];
        end
    end
end


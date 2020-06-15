% K: Cantidad de individuos por torneo.
% TPop: Total de población para torneos.
% N: Cantidad de caracteristicas por individuo.
% T: Torneo.
% FitList: Lista de los Fitness de los individuos a participar.
% TheBest: El índice del mejor del Torneo.

function [Pop] = Selection(PopSelection, K)
    Pop = [];
    IndxsPopSelectionedForXover = [];
    TPop = size(PopSelection, 1);
    N = size(PopSelection, 2);
    for i = 1:TPop
      T = randperm (TPop,K);
      FitList = [];
      for j = 1:size(T,2)
        FitList = [FitList PopSelection(T(j),N)];     
      end
      [~, TheBest] = max(FitList);
      IndxsPopSelectionedForXover = [IndxsPopSelectionedForXover, T(TheBest)];
      Pop = [Pop; PopSelection(T(TheBest),:)];
    end
end
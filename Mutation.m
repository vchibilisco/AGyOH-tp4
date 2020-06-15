% PopMut: poblacion a mutar
% Bounds: matriz de rango

% Return
% newPopMutation: poblacion mutada final

function [newPopMutation] = Mutation(PopMut,Bounds)
    newPopMutation = [];
    TPop = size(PopMut,1);
    N = size(PopMut,2)-1;

    for i=1:TPop
      Ind = PopMut(i,:);
      MutPos = randperm(N-1,1);

      s = rand();
      Ind(MutPos) = s * Ind(MutPos) + (1 - s) * Bounds(MutPos, randi([1 2]));

      newPopMutation = [newPopMutation; Ind(1:end-1) 0];
    end
end
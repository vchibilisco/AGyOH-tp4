% TPop: Total de la poblción a Mutar.
% newPopMutation: Población Mutada.
% N: Cantidad de atributos de cada individuo con su fitness al final.

function [newPopMutation] = Mutation(PopMut,Bounds)
    newPopMutation = [];
    TPop = size(PopMut,1);
    N = size(PopMut,2)-1;
%     for i=1:TPop
%       Ind = PopMut(i,:);
%       MutPos = randperm(N,1);
%       Ind(MutPos) = randi([Bounds(MutPos,1),Bounds(MutPos,2)],1,1);       
%       newPopMutation = [newPopMutation; Ind(1:end-1) 0];
%     end
    for i=1:TPop
      Ind = PopMut(i,:);
      MutPos = randperm(N-1,1);

      s = rand();
      Ind(MutPos) = s * Ind(MutPos) + (1 - s) * Bounds(MutPos, randi([1 2]));

      newPopMutation = [newPopMutation; Ind(1:end-1) 0];
    end
end
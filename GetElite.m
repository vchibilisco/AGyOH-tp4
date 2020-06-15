% PopElite: Individuos de la población que pertenecen a la Elite.
% s: Vector con los indices de la población ordenado por la mejor aptitud de forma descendente.

function [PopElite] = GetElite(Pop,Elite)
    PopElite = [];
    TPop = size(Pop,1);
    N = size(Pop,2);
    [~, s] = sort(Pop(:, N), 'descend');
    for i=1:TPop
      if i <= Elite
        PopElite = [PopElite; Pop(s(i), :)];
      end
    end 
end
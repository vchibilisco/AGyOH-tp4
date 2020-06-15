% PopXover: Individuos de la población que están destinados a Cruzamiento.
% PopMut: Individuos de la población que están destinados a Mutación.
% PopKeep: Individuos de la población que están destinados a pasar a la siguiente generación sin modificación.
% s: Vector con los indices de la población ordenado por la mejor aptitud de forma descendente.

function [PopXover, PopMut, PopKeep] = PopPartition(Pop,Elite,XoverPercent,MutPercent,KeepPercent)
    PopXover = [];
    PopMut = [];
    PopKeep = [];
    TPop = size(Pop,1);
    N = size(Pop,2);
    [~, s] = sort(Pop(:, N), 'descend');
    maxIndx_Xover = XoverPercent*TPop/100;
    maxIndx_Mut = maxIndx_Xover + MutPercent*TPop/100;
    maxIndx_Keep = (maxIndx_Mut + KeepPercent*TPop/100) - Elite;
    % Controlo que sea un numero par para cruzamiento
    if(rem(maxIndx_Xover,2) ~= 0)
      maxIndx_Xover = maxIndx_Xover +1;
    end
    for i=1:TPop
      if i <= maxIndx_Xover
          PopXover = [PopXover; Pop(i, :)];
        elseif i <= maxIndx_Mut
            PopMut = [PopMut; Pop(i, :)];
          elseif i <= maxIndx_Keep
            PopKeep = [PopKeep; Pop(i, :)];
      end
    end 
end
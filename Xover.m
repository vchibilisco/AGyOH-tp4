% PopSelection: Poblacion a cruzar

% Return
% newPopChildren: Hijos que son resultado del cruzamiento.

function [newPopChildren] = Xover(PopSelection)
    newPopChildren = [];
    N = size(PopSelection,2);
    for i = 1:2:size(PopSelection,1)
      R = randi([0 , 1],1, N-1 );
      P1 = PopSelection(i,:);
      P1 = P1(1:end-1);
      P2 = PopSelection(i+1,:);
      P2 = P2(1:end-1);
      C1 = R .* (P2 - P1) + P1;
      C2 = R .* (P1 - P2) + P2;
      newPopChildren = [newPopChildren;[C1 0]];
      newPopChildren = [newPopChildren;[C2 0]];
    end
end
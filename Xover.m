% newPopChildren: Hijos que son resultado del cruzamiento.
% IndxsPopSelectionedForXover: Vector con los indices de los individuos que se van a cruzar.

function [newPopChildren] = Xover(PopSelection)
    newPopChildren = [];
    N = size(PopSelection,2);
    for i = 1:2:size(PopSelection,1)
%       P1 = PopSelection(i,:);
%       P2 = PopSelection(i+1,:);     
%       CutPointer = randperm(N-2,1);
%       P1_1 = P1(1:CutPointer);
%       P1_2 = P1(CutPointer+1:end-1);
%       P2_1 = P2(1:CutPointer);
%       P2_2 = P2(CutPointer+1:end-1);
%       C1 = [P1_1 P2_2];
%       C2 = [P2_1 P1_2];
%       newPopChildren = [newPopChildren;[C1 0]];
%       newPopChildren = [newPopChildren;[C2 0]];
      
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
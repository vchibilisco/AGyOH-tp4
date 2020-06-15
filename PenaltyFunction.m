function [Penalty] = PenaltyFunction(arraySteam,TimeProcess)
  PenaltyBool = 0;  
  Penalty = 0;
  for t=1:TimeProcess
    v = arraySteam(t);
    if v==0 && t~= 1 && t~=TimeProcess
      PenaltyBool = 1;
    end
    if v==0 && (v > 1 || v < 0.5)
      PenaltyBool = 1;
    end
  end
  if PenaltyBool == 1
    Penalty = 50;
  end
end
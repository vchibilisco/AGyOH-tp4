% X: individuo
% TimeProcess: tiempo máximo, en minutos, que posee una corrida
% graf: 1 para graficar, 0 para no graficar

% Return
% ArrayVapors: Array con los vapores que fueron calculados en cada instante
% Penalty: valor asignado cuando un consumo de vapor es 0 cuando el tiempo
%          es diferente a 0 o al tiempo máximo de corrida

function [ArrayVapors, Penalty] = EvaluateIndividualBasedOnTotalExecTime(X, TimeProcess, graf)
  allArrayHoras = [];
  allArrayVapores = [];
  allArrayMinutes = [];

  ArrayHours = [];
  ArrayVapors = [];

  Penalty = 0;

  for t=0:TimeProcess
    tInH = t/60;

    [SteamTotal, ArrayHours, ArrayVapors] = GetSteamTotalByIndividual(X, tInH, ArrayHours, ArrayVapors);

    allArrayHoras = [allArrayHoras tInH];
    allArrayVapores = [allArrayVapores SteamTotal];
    allArrayMinutes = [allArrayMinutes t];

    if SteamTotal == 0 && t ~= 0 && t ~= TimeProcess
      Penalty = Penalty + 1;
    end
    if SteamTotal > 0 && SteamTotal < 1
      Penalty = Penalty - 1;
    end
  end

  if graf == 1
    figure(2);
    plot(ArrayHours, ArrayVapors, allArrayHoras, allArrayVapores);

    figure(3);
    plot(allArrayMinutes,allArrayVapores);
  end
end
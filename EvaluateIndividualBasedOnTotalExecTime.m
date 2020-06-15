% X: individuo
% TimeProcess: tiempo máximo, en minutos, que posee una corrida
% graf: 1 para graficar, 0 para no graficar

% Return
% allArrayVapores: Array con los vapores que fueron calculados en cada instante
% Penalty: valor asignado cuando un consumo de vapor es 0 cuando el tiempo
%          es diferente a 0 o al tiempo máximo de corrida

function [allArraySteam] = EvaluateIndividualBasedOnTotalExecTime(X, TimeProcess, graf)
  allArrayHoras = [];
  allArraySteam = [];
  allArrayMinutes = [];

  ArrayHours = [];
  ArraySteam = [];

  for t=0:TimeProcess
    tInH = t/60;

    [SteamTotal, ArrayHours, ArraySteam] = GetSteamTotalByIndividual(X, tInH, ArrayHours, ArraySteam);

    allArrayHoras = [allArrayHoras tInH];
    allArraySteam = [allArraySteam SteamTotal];
    allArrayMinutes = [allArrayMinutes t];
  end

  if graf == 1
    figure(2);
    plot(ArrayHours, ArraySteam, allArrayHoras, allArraySteam);

    figure(3);
    plot(allArrayMinutes,allArraySteam);
  end
end
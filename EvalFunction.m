% X: individuo
% TimeProcess: tiempo máximo de corrida

% Return
% ResultTotal: valor de fitness

function [ResultTotal] = EvalFunction(X, TimeProcess)
    [ArraySteam] = EvaluateIndividualBasedOnTotalExecTime(X, TimeProcess, 0);
    [DiffMaxMin] = DiffSteam(ArraySteam);
    [DiffLIwithTP] = DiffTime(X);
    [Penalty] = PenaltyFunction(ArraySteam,TimeProcess);
    [calArea] = CalArea(ArraySteam);
    
    ResultTotal = (5 * DiffMaxMin) + (4 * DiffLIwithTP) + (5 * calArea) - (2 * Penalty);
end
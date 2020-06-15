% X: individuo
% TimeProcess: tiempo máximo de corrida

% Return
% ResultTotal: valor de fitness

function [ResultTotal] = EvalFunction(X, TimeProcess)
    [ArrayVapors, Penalty] = EvaluateIndividualBasedOnTotalExecTime(X, TimeProcess, 0);
    [DiffMaxMin] = DiffSteam(ArrayVapors);
    
    ResultTotal = (15 * DiffMaxMin) - (12 * Penalty);
end
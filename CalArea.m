function [Result] = CalArea(arrSteam)
  Result = size(arrSteam,2) - sum(abs(arrSteam - mean(arrSteam)));
end
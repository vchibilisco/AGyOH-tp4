% TPop: Tama�o de la Poblaci�n.
% N: Cantidad "Par" de caracteristicas por individuo.
% Bounds: matriz que indica los valores maximo y minimo de cada variable.
% EvalFunction: Funci�n de evaluci�n.
% Pop: Poblaci�n.
% Generation: Cantidad de Generaciones.
% Elite: Cantidad de Individuos de Elite.
% XoverPercent: Porcentaje de la poblaci�n para cruzamiento.
% MutPercent: Porcentaje de la poblaci�n para Mutaci�n.
% KeepPercent: Porcentaje de la poblaci�n que se mantiene sin cambios (Este porcentaje contempla la Elite).
% K: Cantidad de participantes por Torneo.

QuantityContainers = 10;
TimeInH = 8;
TimeM = TimeInH * 60;
TimeProcess = TimeM;
maxTimeInitContainer = TimeProcess - 60;

% Generation = 300;
% TPop = 400;
Generation = 300;
TPop = 400;
N = QuantityContainers;
Elite = 1;
XoverPercent = 60;
MutPercent = 10;
KeepPercent = 30;
K = 2;

Bounds = [zeros(N, 1) (maxTimeInitContainer .* ones(N, 1))];

TheBestIndByGeneration = [];
TheBestValueByGeneration = [];
MedByGeneration = [];
xGen = [];

if (XoverPercent+MutPercent+KeepPercent) ~= 100
  error('Los Porcentajes deben sumar 100.')
end

% Genera Poblaci�n Inicial
Pop = [randi([0,maxTimeInitContainer],TPop,N) zeros(TPop, 1)];

% Aplica Funci�n de Evaluaci�n
for i=1:TPop
    Pop(i, N+1) = EvalFunction([Pop(i, 1:N)], TimeProcess);
end
% Recorremos Generaciones

%hold on;
for z = 1:Generation
  % Selecci�n de la Elite
  [PopElite] = GetElite(Pop,Elite);
  % Selecci�n por Torneo a toda la Poblaci�n
  Pop = Selection(Pop,K);
  % Partici�n de la poblaci�n
  [PopXover, PopMut, PopKeep] = PopPartition(Pop,Elite,XoverPercent,MutPercent,KeepPercent);
  % Selecci�n y Cruzamiento
  [newPopChildren] = Xover(PopXover);
  % Mutaci�n
  [newPopMutation] = Mutation(PopMut,Bounds);
  % Nueva Poblaci�n
  Pop = [newPopChildren;newPopMutation;PopKeep;PopElite];
  % Aplica Funci�n de Evaluaci�n
  for i=1:TPop
    Pop(i, N+1) = EvalFunction(Pop(i, 1:N),TimeProcess);
  end
  [TheBestValue, pos] = max(Pop(:, N+1));
  TheBestIndByGeneration = [TheBestIndByGeneration; Pop(pos,:)];
  TheBestValueByGeneration = [TheBestValueByGeneration; TheBestValue];
  MedPop = mean(Pop(:, N+1));
  MedByGeneration = [ MedByGeneration ; MedPop];
  xGen = [xGen z];
  
  disp('--------------------------------------');
  disp('Generaci�n ');
  disp(z);
  disp(' Mejor Fitness: ');
  disp(TheBestValue);
  disp('--------------------------------------');
end
plot(xGen,TheBestValueByGeneration,xGen,MedByGeneration);
%hold off;

EvaluateIndividualBasedOnTotalExecTime([TheBestIndByGeneration(Generation,1:N)], TimeProcess, 1);
 
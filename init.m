% TPop: Tamaño de la Población.
% N: Cantidad "Par" de caracteristicas por individuo.
% Bounds: matriz que indica los valores maximo y minimo de cada variable.
% EvalFunction: Función de evalución.
% Pop: Población.
% Generation: Cantidad de Generaciones.
% Elite: Cantidad de Individuos de Elite.
% XoverPercent: Porcentaje de la población para cruzamiento.
% MutPercent: Porcentaje de la población para Mutación.
% KeepPercent: Porcentaje de la población que se mantiene sin cambios (Este porcentaje contempla la Elite).
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

% Genera Población Inicial
Pop = [randi([0,maxTimeInitContainer],TPop,N) zeros(TPop, 1)];

% Aplica Función de Evaluación
for i=1:TPop
    Pop(i, N+1) = EvalFunction([Pop(i, 1:N)], TimeProcess);
end
% Recorremos Generaciones

%hold on;
for z = 1:Generation
  % Selección de la Elite
  [PopElite] = GetElite(Pop,Elite);
  % Selección por Torneo a toda la Población
  Pop = Selection(Pop,K);
  % Partición de la población
  [PopXover, PopMut, PopKeep] = PopPartition(Pop,Elite,XoverPercent,MutPercent,KeepPercent);
  % Selección y Cruzamiento
  [newPopChildren] = Xover(PopXover);
  % Mutación
  [newPopMutation] = Mutation(PopMut,Bounds);
  % Nueva Población
  Pop = [newPopChildren;newPopMutation;PopKeep;PopElite];
  % Aplica Función de Evaluación
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
  disp('Generación ');
  disp(z);
  disp(' Mejor Fitness: ');
  disp(TheBestValue);
  disp('--------------------------------------');
end
plot(xGen,TheBestValueByGeneration,xGen,MedByGeneration);
%hold off;

EvaluateIndividualBasedOnTotalExecTime([TheBestIndByGeneration(Generation,1:N)], TimeProcess, 1);
 
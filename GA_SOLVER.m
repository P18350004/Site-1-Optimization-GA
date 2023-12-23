clc
clear all

rng( 2 , 'twister')

%% Problem setting
lb = [0 0 0 0 0 0 80 100 100 100 100 100];              %lower limit of search space 
ub = [4  4 5 6 9 19 150 250 250 450 450 450];          % upper limit of search space

prob = @Fitness_misfit;     %fitness function

%% Algorithm Parameters

Np = 200;  % number of iteration samples
T = 100 ;   % number of iterations
Pc= 0.70;    % Crossover
Pm = 0.1;    % mutation
etac = 10;   % selection
etam =10;    % selection
%% Genetic algorithm

f = NaN(Np,1);
BestFitIter = NaN(T+1,1);
OffspringObj = NaN(Np,1);

D = length(lb);

P = repmat(lb,Np,1) + repmat((ub-lb),Np,1).*rand(Np,D);

for p =1:Np
    f(p) = prob(P(p,:));
end
BestFitIter(1) = min(f);

%% iteration loop
for t = 1:T
    
    
    %% tournament selection
    
    MatingPool = TournamentSelection(f,Np);
    Parent = P(MatingPool,:);
    
    %% crossover
    
    offspring = CrossoverSBX(Parent,Pc,etac,lb,ub);
    
    %% mutation
    
    offspring = MutationPoly(offspring,Pm,etam,lb,ub);
    
    for j = 1:Np
        OffspringObj(j) = prob(offspring(j,:));
    end
    
    CombinedPopulation = [P; offspring];
    [f,ind] = sort([f;OffspringObj]);
    
    f=f(1:Np);
    P = CombinedPopulation(ind(1:Np),:);
    
    BestFitIter(t+1)=min(f);
    disp(['Iteration' num2str(t) ' : bestfitness = ' num2str(BestFitIter(t+1))]);
end

[bestfitness,ind] = min(f);
bestsol = P(ind,:);

plot(0:T , BestFitIter);
xlabel('Iteration');
ylabel('Best Fitness Value');
title('Genetic Algorithm Optimization');
set(gca,'Fontsize',16,'Fontname','Times New Roman');
set(gcf,'units','centimeters')
% pos = [2, 2, FigWidth, FigHeight]; 
% set(gcf,'Position',pos)
save Result

function offspring = CrossoverSBX(Parent,Pc,etac,lb,ub)

[Np,D] = size(Parent);
indx = randperm(Np);
Parent = Parent(indx,:);
offspring = NaN(Np,D);

for i = 1 : 2: Np
    r = rand;
    
    if r < Pc
        
        for j = 1 : D
            
            r = rand;
            if r <=0.5
                beta = (2*r)^(1/(etac+1));
            else
                beta = (1/(2*(1-r)))^(1/(etac+1));
            end
            
            offspring(i,j) = 0.5*(((1 + beta)*Parent(i,j)) + (1-beta)*Parent(i+1,j));
            offspring(i+1,j) = 0.5*(((1 - beta)*Parent(i,j)) + (1+beta)*Parent(i+1,j))
        end
        
        offspring(i,:) = max(offspring(i,:),lb);
        offspring(i+1,:) = min(offspring(i+1,:),ub);
        
    else
        
        offspring(i,:) = Parent(i,:);
        offspring(i+1,:) = Parent(i+1,:);
    end
end
    
function MatingPool = TournamentSelection(f,Np)

MatingPool = NaN(Np,1);
indx = randperm(Np);

for i = 1 : Np-1
    Candidate = [ indx(i) indx(i+1)];
    CandidateObj = f(Candidate);
    [~,ind] = min(CandidateObj);
    MatingPool(i) = Candidate(ind);
end

Candidate = [indx(Np) indx(1)];
CandidateObj = f(Candidate);
[~,ind] = min(CandidateObj);
MatingPool(Np) = Candidate(ind);
        
     
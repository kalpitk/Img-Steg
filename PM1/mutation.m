%--------------------------------------------
% Mutates a chromosome with a small probability
%--------------------------------------------
function final_chrom = mutation(chrom, mutationProbability)
    final_chrom = chrom;
    len = length(chrom);
    if(rand() < mutationProbability)
       rand_ind = floor(1 + len*rand());
       final_chrom(rand_ind) = 1-final_chrom(rand_ind);
    end
end

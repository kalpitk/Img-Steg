function final_chrom = mutation(chrom)
    MUTATION_PROBABILITY = 0.01;
    final_chrom = chrom;
    len = length(chrom);
    if(rand() < MUTATION_PROBABILITY)
       rand_ind = floor(1 + len*rand());
       final_chrom(rand_ind) = 1-final_chrom(rand_ind);
    end
end

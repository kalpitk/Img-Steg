function child_population = nextGen(population,fitness_population)
    [pop_size chrom_len] = size(population);
    child_population = zeros(pop_size,chrom_len);
    for i = 1:pop_size
        index1 = selectParent(fitness_population);
        index2 = selectParent(fitness_population);
        par1 = population(index1,:);
        par2 = population(index2,:);
        child_chromo = crossover(par1,par2);
        child_chromo = mutation(child_chromo);
        child_population(i,:) = child_chromo;
    end
end
    
function parent_index = selectParent(fitness_population)
    fitness_max = max(fitness_population);
    len = length(fitness_population);
    while 1
       rand_ind = floor(1 + len*rand());
       rand1 = floor(1 + (fitness_max)*rand());
       if fitness_population(rand_ind) >= (rand1)
           parent_index = rand_ind;
           break;
       end
    end
    
end

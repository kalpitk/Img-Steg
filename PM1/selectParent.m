function parent_index = selectParent(fitness_population)
    fitness_max = 1000^(max(fitness_population));
    len = length(fitness_population);

    while 1
       rand_ind = floor(1 + len*rand());
       rand1 = (fitness_max)*rand();
       if fitness_population(rand_ind) >= log(rand1)/log(1000)
           parent_index = rand_ind;
           break;
       end
    end

end

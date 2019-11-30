%---------------------------------------------
% Initializes population for Genetic Algorithm
%---------------------------------------------
function population = initPop(chrom_length,size_pop)
    population = zeros(size_pop,chrom_length);
    population(1,:) = ones(1,chrom_length);
    population(2,:) = zeros(1,chrom_length);
    for i = 3:size_pop
        for j = 1:chrom_length
            population(i,j) = round(rand());
        end
    end
end

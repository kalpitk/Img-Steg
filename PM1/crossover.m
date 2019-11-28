function crossed_chrom = crossover(chrom1,chrom2)
    len = length(chrom1);
    crossed_chrom = zeros(1,len);
    for i = 1:len
        if rand()>0.5
            crossed_chrom(i) = chrom1(i);
        else
            crossed_chrom(i) = chrom2(i);
        end
    end
end

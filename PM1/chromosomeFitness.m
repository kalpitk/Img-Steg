%--------------------------------------------
% Calculates Fitness of Chromosome
% 
% May depend on either -
% - 1/rob
% - psnr
%--------------------------------------------
function fitnessVal = chromosomeFitness(chromosome, hostImg, hostCoeff, hostDC_coeff, changePositions)
    [n m] = size(hostImg);

	AC = updateCoeff(hostCoeff, changePositions, chromosome);

	newImg = invDCTarray(hostDC_coeff, AC, n, m);

	fitnessVal = psnr(hostImg, newImg);
end
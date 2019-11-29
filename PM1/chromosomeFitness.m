function fitnessVal = chromosomeFitness(chromosome, hostImg, hostCoeff, hostDC_coeff, changePositions)
    [n m] = size(hostImg);

	AC = updateCoeff(hostCoeff, changePositions, chromosome);

	newImg = invDCTarray(hostDC_coeff, AC, n, m);

	fitnessVal = 1.0/rob(hostImg, newImg);
end
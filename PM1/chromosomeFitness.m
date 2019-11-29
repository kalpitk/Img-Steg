function fitnessVal = chromosomeFitness(chromosome, hostImg, hostCoeff, hostDC_coeff, changePositions)
	newCoeff = updateCoeff(hostCoeff, changePositions, chromosome);

	[n m] = size(hostImg)
	newImg = invDCTarray(hostDC_coeff, newCoeff, n, m);

	fitnessVal = rob(hostImg, newImg);
end
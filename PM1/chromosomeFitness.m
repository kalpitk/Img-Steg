function fitnessVal = chromosomeFitness(chromosome, hostImg, hostCoeff, hostDC_coeff, changePositions)
	newCoeff = hostCoeff;

	len = length(chromosome);
	for i = 1:len
		if chromosome(i)=='0'
			newCoeff(changePositions(i)) = newCoeff(changePositions(i)) - 1;
		else
			newCoeff(changePositions(i)) = newCoeff(changePositions(i)) + 1;
		end
	end

	[n m] = size(hostImg)
	newImg = invDCTarray(hostDC_coeff, newCoeff, n, m);

	fitnessVal = rob(hostImg, newImg);
end
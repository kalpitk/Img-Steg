function newCoeff = updateCoeff(hostCoeff, changePositions, chromosome)
    newCoeff = hostCoeff;
	len = length(chromosome);
	for i = 1:len
		if chromosome(i)=='0'
			newCoeff(changePositions(i)) = newCoeff(changePositions(i)) - 1;
		else
			newCoeff(changePositions(i)) = newCoeff(changePositions(i)) + 1;
		end
	end
end
function fitnessVal = chromosomeFitness(chromosome, hostImg, hostCoeff, hostDC_coeff, changePositions)
    [n m] = size(hostImg);
    % disp("CCCC");
	% disp(chromosome);
	AC = updateCoeff(hostCoeff, changePositions, chromosome);
	newImg = invDCTarray(hostDC_coeff, AC, n, m);

	% disp(newImg(1:10));

	% disp(psnr(hostImg,newImg));

	fitnessVal = rob(hostImg, newImg);
end
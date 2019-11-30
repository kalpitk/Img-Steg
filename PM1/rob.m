%--------------------------------------------
% Calculate ROB for the steganographic image
%--------------------------------------------
function r = rob(hostImg, stegImg)
	v1 = getBlockiness(stegImg);
	v2 = getBlockiness(hostImg);

	r = v1/v2;
end
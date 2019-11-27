function r = rob(hostImg, stegImg)
	r = getBlockiness(stegImg)/getBlockiness(hostImg);
end
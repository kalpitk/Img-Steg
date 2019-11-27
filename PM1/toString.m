function str =  toString(binaryStr)
	str = char(bin2dec(reshape(char(binary+'0'), 8,[]).'));
end
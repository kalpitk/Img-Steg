function str =  toString(binaryStr)
	str = char(bin2dec(reshape(char(binaryStr+'0'), 7,[]).'));
    str = string(reshape(str,1,[]));
end
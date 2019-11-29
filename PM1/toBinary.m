function res = toBinary(msg)
	b = dec2bin(msg,8);
    len = length(msg);
    
    res = zeros(len*8);
    
    for i = 1:len
        res(i:i+8) = b(i);
    end
end
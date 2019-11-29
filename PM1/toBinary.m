function binString = toBinary(msg)
binString = reshape(dec2bin(char(msg),7).'-'0',1,[])
end
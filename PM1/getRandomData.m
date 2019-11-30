%--------------------------------------------
% Generates random character data
% of given length
%--------------------------------------------
function randData = getRandomData(len)
    randDataBinary = zeros(1,7*len);
    for i = 1:len
        ran = toBinary(floor(48 + (123-48)*rand()));
        randDataBinary(1,7*(i-1)+1:(7*i)) = ran;
    end
    randData = toString(randDataBinary);
end

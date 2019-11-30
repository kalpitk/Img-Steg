%--------------------------------------------
% Find appropriate locations for embedding data
%
% Locations with values greater than 1
% or less than -1 picked
%
% Returns array of indices
%--------------------------------------------
function change = findLocations(inpCoeff,secMsg)
    MAX_SIZE = 240000;

    updSecMsg = appendLength_msg(secMsg);
    change = zeros(1,MAX_SIZE);
    inpIt=1; secIt=1;
    
    count = 1;
    
    while secIt<=length(updSecMsg)
        if inpCoeff(inpIt)>1
            if mod(inpCoeff(inpIt)+updSecMsg(secIt),2) == 1
                change(count) = inpIt;
                count = count + 1;
            end
            secIt = secIt + 1;
        elseif inpCoeff(inpIt)<-1
            if mod(inpCoeff(inpIt)+updSecMsg(secIt),2) == 0
                change(count) = inpIt;
                count = count + 1;
            end
            secIt = secIt + 1;
        end
        inpIt = inpIt + 1;
    end

    if count == 1
        change = [];
    else
        change = change(1:count-1);
    end
    
end
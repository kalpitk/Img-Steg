function change = findLocations(inpCoeff,secMsg)
    updSecMsg = appendLength_msg(secMsg);
    change = [];
    inpIt=1;secIt=1;
    
    while secIt<=length(updSecMsg)
        if inpCoeff(inpIt)>1
            if mod(inpCoeff(inpIt)+updSecMsg(secIt),2)==1
                   change = [change inpIt];
            end
            secIt = secIt+1;
        elseif inpCoeff(inpIt)<-1
            if mod(inpCoeff(inpIt)+updSecMsg(secIt),2)==0
                   change = [change inpIt];
            end
            secIt = secIt+1;
        end
        inpIt = inpIt+1;
    end
    
end
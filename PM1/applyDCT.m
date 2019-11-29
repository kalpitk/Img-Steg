function [dct_quantized] = applyDCT(I)
	I1=I;
	[row coln]= size(I);
	I= double(I);
	I = I - (128*ones(512));

	for i1=[1:8:row]
	    for i2=[1:8:coln]
	        zBLOCK=I(i1:i1+7,i2:i2+7);
	        win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
	        dct_domain(i1:i1+7,i2:i2+7)=win1;
	    end
	end

	for i1=[1:8:row]
	    for i2=[1:8:coln]
	        win1 = dct_domain(i1:i1+7,i2:i2+7);
	        win2=round(win1./QX);
	        dct_quantized(i1:i1+7,i2:i2+7)=win2;
	    end
	end
end
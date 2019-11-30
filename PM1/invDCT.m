%--------------------------------------------
% Calculate inverse of Quantized DCT
% of an RGB image of 8x8 Size
%--------------------------------------------
function K = invDCT(dct_img, row, coln)

	global QX
	global DCT_matrix8
	global iDCT_matrix8

	dct_restored = zeros(row,coln);
	%-----------------------------------------------------------
	% Jpeg Decoding 
	%-----------------------------------------------------------
	% Dequantization of DCT Coefficients
	%-----------------------------------------------------------
	for i1=[1:8:row]
	    for i2=[1:8:coln]
	        win2 = dct_img(i1:i1+7,i2:i2+7);
	        win3 = win2.*QX;
	        dct_dequantized(i1:i1+7,i2:i2+7) = win3;
	    end
	end
	%-----------------------------------------------------------
	% Inverse DISCRETE COSINE TRANSFORM
	%-----------------------------------------------------------
	for i1=[1:8:row]
	    for i2=[1:8:coln]
	        win3 = dct_dequantized(i1:i1+7,i2:i2+7);
	        win4=iDCT_matrix8*win3*DCT_matrix8;
	        dct_restored(i1:i1+7,i2:i2+7)=win4;
	    end
	end
	I2=dct_restored;



	% ---------------------------------------------------------
	% Conversion of Image Matrix to Intensity image
	%----------------------------------------------------------

	TARGET_IMG_SIZE = 2048;

	img1 = zeros(TARGET_IMG_SIZE,TARGET_IMG_SIZE,3);
	for i = 1:TARGET_IMG_SIZE
		for j = 1:TARGET_IMG_SIZE
			img1(i,j,1) = I2(i,j);
			img1(i,j,2) = I2(i,j+TARGET_IMG_SIZE);
			img1(i,j,3) = I2(i,j+TARGET_IMG_SIZE*2);
		end
	end
	K=uint8(255.*mat2gray(img1));
end
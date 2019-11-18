function steg_dct = get_mr_ll(cr_i,hidden_image,beta)
    [m n p]=size(cr_i);
	[hm hn hp]=size(hidden_image);
	hidden_image2 = zeros(m/2, n/2,3);
	hidden_image2(1:hm,1:hn,:) = hidden_image;
    [cr_ll,cr_lh,cr_hl,cr_hh]=dwt2(cr_i,'haar');
    mr_ll = cr_ll + beta*double(hidden_image2);
    steg_dct = idwt2(mr_ll,cr_lh,cr_hl,cr_hh,'haar');
end
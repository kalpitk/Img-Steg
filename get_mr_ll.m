function steg_dct = get_mr_ll(cr_i,hidden_image,beta)
    [m n p]=size(cr_i);
    hidden_image2 = imresize(hidden_image,[m/2 n/2]);
    [cr_ll,cr_lh,cr_hl,cr_hh]=dwt2(cr_i,'haar');
    mr_ll = cr_ll + beta*double(hidden_image2);
    steg_dct = idwt2(mr_ll,cr_lh,cr_hl,cr_hh,'haar');
end
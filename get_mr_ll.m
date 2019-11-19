function steg_dct = get_mr_ll(cr_i,hidden_image,beta)
    [cr_ll,cr_lh,cr_hl,cr_hh]=dwt2(cr_i,'haar');
    mr_ll = cr_ll + beta*double(hidden_image);
    steg_dct = idwt2(mr_ll,cr_lh,cr_hl,cr_hh,'haar');
end
function hidden_ll = get_hidden(steg_dct,host_image_dct,beta)

    [host_ll,host_lh,host_hl,host_hh]=dwt2(host_image_dct,'haar');
    [steg_ll,a,bb,ccc]=dwt2(steg_dct,'haar');

    hidden_ll = (steg_ll - host_ll)/beta;
    
end
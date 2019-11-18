function hidden_ll = get_hidden(steg_dct,host_image_dct,beta)
	disp(size(steg_dct));
	disp(size(host_image_dct));
    [host_ll,host_lh,host_hl,host_hh]=dwt2(host_image_dct,'haar');
    [steg_ll,~,~,~]=dwt2(steg_dct,'haar');
    disp(size(host_ll));
    hidden_ll = (steg_ll - host_ll)/beta;
    disp(hidden_ll);
end
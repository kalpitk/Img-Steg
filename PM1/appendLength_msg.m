function newMsg = appendLength_msg(msg)
    msg_len = length(msg);
    str_len = dec2bin(msg_len);
    zeros_append = zeros(1,16-length(str_len));
    newMsg = [zeros_append msg];
end

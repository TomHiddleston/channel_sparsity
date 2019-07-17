function [beam_code_book_from_matlab] = generate_beam_codebook_32_angulars()
%GENERATE_BEAM_CODEBOOK 此处显示有关此函数的摘要
%   此处显示详细说明

    rx_beam_num = 32;
    tx_beam_num = 32;
    beam_codebook = zeros(32*32,32*32) + zeros(32*32,32*32)*1i;
    angular_set = linspace(-pi,pi,32);
    for i= 1:rx_beam_num
        for j = 1:tx_beam_num
             rx_ant_response_vect_set = generate_response_vect(angular_set(i));
             tx_ant_response_vect_set = generate_response_vect(angular_set(j));
             
             beam_base = rx_ant_response_vect_set * (tx_ant_response_vect_set');
             beam_codebook(:,(i-1)*rx_beam_num+j) = reshape(beam_base,1024,1);
        end
    end
    beam_code_book_from_matlab = beam_codebook;
    size(beam_code_book_from_matlab);
    
    function response_vect = generate_response_vect(angular)
            response_vect = zeros(32,1) + zeros(32,1)*1i;
            for k = 1:32
                response_vect(k) = 1/sqrt(32) * exp(angular*(k-1)*1i);
            end
    end          
end

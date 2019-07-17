function  [coeff] = CVXOPT_32_32(channel_matrix,beam_code_book)
%  
channel_matrix = channel_matrix*10^7;
% channel_matrix = fake_channel();
% channel_matrix = channel_data()*10^7;
% beam_code_book = generate_beam_codebook_32_angulars();

n = 1024; 
lambda_coeff = 100; 
% lambda_coeff = 10000;

cvx_begin
    variable alpha_coeff(n) complex ; % = ones(n)
    expression H_hat(32,32) ;
%     expression Sum_alpha ;
    Sum_alpha = sum(abs((real(alpha_coeff)))+abs(imag(alpha_coeff)));
    
    for k = 1: n
        H_hat = H_hat + (alpha_coeff(k)* (reshape(beam_code_book(:,k),32,32)));        
    end
    
    minimize(pow_pos(norm(channel_matrix - H_hat),2) + lambda_coeff *Sum_alpha);
    
%     minimize( (norm(channel_matrix(1,:).' - base_angular.' * alpha_coeff))^2 +lambda_coeff * sum(abs(alpha_coeff(:)))) 
%     minimize((pow_pos(norm(channel_matrix(1,:,:) - sum (alpha_coeff() .*base_angular(i) )),2)) +lambda_coeff * sum(abs((real(alpha_coeff(:))))+abs(imag(alpha_coeff(:))))) 
%     minimize((pow_pos(norm(channel_matrix(1,:).' - base_angular.' * alpha_coeff),2)) +lambda_coeff * sum(norm(alpha_coeff(:)))) 

%     subject to
%         alpha_coeff(:) >=0

cvx_end

coeff = alpha_coeff; 
% norm_squr = pow_pos(norm(channel_matrix - H_hat),2)
% pro = lambda_coeff *Sum_alpha
% rate = norm_squr/pro

% print(pow_pos(norm(channel_matrix(1,:).' - base_angular.' * alpha_coeff),2))
% print(sum(abs(real(alpha_coeff(:)))+abs(imag(alpha_coeff(:)))))

% cdfplot(alpha_coeff)

% subplot(2,2,1);
% % cdfplot((real(alpha_coeff(:)))+(imag(alpha_coeff(:))))
% cdfplot(abs((real(alpha_coeff(:))))+abs(imag(alpha_coeff(:))))
% 
% subplot(2,2,2);
% cdfplot(sqrt((real(alpha_coeff(:))).^2+(imag(alpha_coeff(:))).^2))
% subplot(2,2,3);
% cdfplot(real(alpha_coeff(:)))
% subplot(2,2,4);
% cdfplot(imag(alpha_coeff(:)))

end


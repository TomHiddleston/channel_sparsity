function [AoA_angular,AoD_angular] = recover_angular_32(alpha_coeff)
%RECOVER_ANGULAR 此处显示有关此函数的摘要
%   此处显示详细说明

% alpha_coeff = load('matlab.mat');
% alpha_coeff=cell2mat(struct2cell(alpha_coeff));
% channel_matrix = load('channel_matrix.mat');
% channel_matrix=cell2mat(struct2cell(channel_matrix));

% alpha_coeff = CVXOPT_32_32();

alpha_norm  = abs(real(alpha_coeff))+abs(imag(alpha_coeff));
% alpha_norm = sqrt((real(alpha_coeff)).^2 + (imag(alpha_coeff)).^2);
[alpha_norm_descend,alpha_norm_descend_index ] = sort(alpha_norm,'descend');
% plot(alpha_norm_descend)
% hold on
tem_sum =0;tem_count= 0;
for i = 1:1:length(alpha_norm_descend)
    tem_sum = tem_sum + alpha_norm_descend(i);
%     link = find(alpha_norm == alpha_norm_descend(i));
%     angular_set_index = [angular_set_index;link];
    tem_count = tem_count+1;
    if ((tem_sum /sum(alpha_norm))>=0.9)
        break        
    end    
end
% tem_count
% 
% for pp = 1:length(alpha_norm_descend)
% 
% base_num = floor(length(alpha_norm_descend)*0.1)
base_num = tem_count;
% base_num = pp;
% 
angular_set_index = alpha_norm_descend_index(1:base_num);
% linspace(-(np.pi),(np.pi),32)
AoA = zeros(base_num,1);
AoD = zeros(base_num,1);
% 
% 
for k = 1:1:base_num

if (rem(angular_set_index(k),32))
AoA(k) = floor(angular_set_index(k)/32)+1;
AoD(k) = rem(angular_set_index(k), 32);
else

AoA(k) = floor(angular_set_index(k)/32);
AoD(k) = 32;
end

% AoA =   (pi/16) *AoA ;
% AoD =  (pi/16) * AoD ;
end
% 

AoA_items = unique(AoA);
AoA_nums = numel(AoA_items);

AoA_angular = AoA * pi/16 -pi;


AoD_items = unique(AoD);
AoD_nums = numel(AoD_items);

AoD_angular = AoD * pi/16 -pi;
 
num_alpha_aoa_aod =[tem_count,AoA_nums,AoD_nums]
end
% 
% subplot(1,2,1)
% plot(AoA_nums)
% subplot(1,2,2)
% plot(AoD_nums)
% %end
% scatter(AoA,AoD)


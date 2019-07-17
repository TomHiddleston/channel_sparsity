alpha_set = load('alpha_coeff_h16_h20_7_lambda_100_angular_32.mat');
alpha_set = cell2mat(struct2cell(alpha_set));

[~,alpha_nums] = size(alpha_set);

% if alpha_nums > 5
%     alpha_set_sub = alpha_set(:,1:5);
% end
    
for i = 1 : 5
    index_a = i+15
    alpha_coeff = alpha_set(:,i);
    [AoA, AoD] = recover_angular_32(alpha_coeff)
    scatter(AoA,AoD)

    xlabel('AoA')
    ylabel('AoD')
    xlim([-pi pi])
    ylim([-pi pi])
    hold on 
end

% alpha_coeff_h1 = load('matlab.mat');
% alpha_coeff_h1=cell2mat(struct2cell(alpha_coeff_h1));

% alpha_coeff_h2 = load('alpha_coeff_h2_8_lambda_100_angular_32.mat');
% alpha_coeff_h2=cell2mat(struct2cell(alpha_coeff_h2));
% 
% alpha_coeff_h3_h5 = load('alpha_coeff_h3_h5_8_lambda_100_angular_32.mat');
% alpha_coeff_h3_h5=cell2mat(struct2cell(alpha_coeff_h3_h5));
% alpha_coeff_h3 =alpha_coeff_h3_h5(:,1); 
% alpha_coeff_h4 =alpha_coeff_h3_h5(:,2); 
% alpha_coeff_h5 =alpha_coeff_h3_h5(:,3); 
% 
% % [AoA1, AoD1] = recover_angular_32(alpha_coeff_h1);
% [AoA2, AoD2] = recover_angular_32(alpha_coeff_h2);
% [AoA3, AoD3] = recover_angular_32(alpha_coeff_h3);
% [AoA4, AoD4] = recover_angular_32(alpha_coeff_h4);
% [AoA5, AoD5] = recover_angular_32(alpha_coeff_h5);

% scatter(AoA1,AoD1)
% hold on
% scatter(AoA2,AoD2)
% hold on
% scatter(AoA3,AoD3)
% hold on
% scatter(AoA4,AoD4)
% hold on
% scatter(AoA5,AoD5)
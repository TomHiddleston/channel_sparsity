% aaa = load('alpha_coeff_h1.mat');
% aaa=cell2mat(struct2cell(aaa));
% 
% bbb = load('alpha_coeff_h1_lambda_500.mat');
% bbb=cell2mat(struct2cell(bbb));
% 
% [a1,a2] = recover_angular(aaa)
% [b1,b2] = recover_angular(bbb)
PathRoot='part_data/';

files_list=dir(fullfile(PathRoot));
files_num = size(files_list,1)-2;
alpha_coeff_set = zeros(32*32, files_num);
beam_code_book = generate_beam_codebook_32_angulars();

for k=3:files_num+2
    
% 	files_list(k).name
    channel_mat = channel_data(files_list(k).name);
    size(channel_mat);
    alpha_coeff_set(:,k-2)=CVXOPT_32_32(channel_mat,beam_code_book);   
    disp(['FINISHED ',files_list(k).name])
    
end

save alpha_coeff_h1_h5_7_lambda_100_angular_32 alpha_coeff_set







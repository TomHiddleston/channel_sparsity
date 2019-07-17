
function [channel_matrix] = channel_data(file_path)
file_name = fullfile('part_data/',file_path)

% function [channel_matrix] = channel_data()
% file_name = 'hmatrix_ula_fullpath/hmatrix.txSet001.txPt001.rxSet002.rxPt002.inst001.csv';

raw_data = csvread(file_name);
raw_data_real = raw_data(:,1:32);
raw_data_imag = raw_data(:,33:64);
channel_matrix = raw_data_real + raw_data_imag * 1i;
end





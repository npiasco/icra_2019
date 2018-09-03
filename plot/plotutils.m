clear all;
close all;
clc;

dataset = 'Results_snow_queries/';
%dataset = 'Results_lt_queries/';
%dataset = 'Results_night_queries/';
%dataset = 'Results_default/';

%metric = 'distance/';
metric = 'recall/';

if strcmp(metric, 'distance/')
    MarkerIndices = 1:5:50;
else
    MarkerIndices = [1, 2, 3, 4, 5, 10, 15, 20, 25];
end


data_1 = struct;
data_1.name = 'MAC';
data_1.pref = '(A)';
data_1.color = 'r';
data_1.first = ['data/RGB/', dataset, metric, 'A_MAC.csv'];
data_1.first_prefx = ' ';
data_1.second = ['data/RGBtrainD_A/', dataset, metric, 'A_MAC_BUTF.csv'];
data_1.second_prefx = '+BUTF ';
data_1.third = ['data/RGBtrainD_A/', dataset, metric, 'A_BUTF_MAC_ots_night.csv'];
data_1.third_prefx = '+HALL+Night ';
data_1.fourth = ['data/RGBtrainD_A/', dataset, metric, 'A_MAC_HALL.csv'];
data_1.fourth_prefx = '+HALL ';

data_2 = struct;
data_2.name = 'MAC';
data_2.pref = '(R18)';
data_2.color = 'm';
data_2.first = ['data/RGB/', dataset, metric, 'R18_MAC.csv'];
data_2.first_prefx = ' ';
data_2.second = ['data/RGBtrainD_A/', dataset, metric, 'R18_MAC_BUTF.csv'];
data_2.second_prefx = '+BUTF ';
% data_2.third = ['data/RGBtrainD_A/', dataset, metric, 'R18_BUTF_MAC_ots_night.csv'];
% data_2.third_prefx = '+BUTF+Night ';
% data_2.fourth = ['data/RGBtrainD_A/', dataset, metric, 'R18_MAC_HALL.csv'];
% data_2.fourth_prefx = '+HALL ';

data_3 = struct;
data_3.name = 'NetVLAD';
data_3.pref = '(A)';
data_3.color = 'b';
data_3.first = ['data/RGB/', dataset, metric, 'A_NetVLAD.csv'];
data_3.first_prefx = ' ';
data_3.second = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_BUTF.csv'];
data_3.second_prefx = '+BUTF ';
% data_3.third = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_BUTF_night.csv'];
% data_3.third_prefx = '+BUTF+Night ';
data_3.fourth = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_HALL.csv'];
data_3.fourth_prefx = '+HALL ';

data_4 = struct;
data_4.name = 'NetVLAD';
data_4.pref = '(R18T)';
data_4.color = 'c';
data_4.first = ['data/RGB/', dataset, metric, 'R18T_NetVLAD.csv'];
data_4.first_prefx = ' ';
% data_4.second = ['data/RGBtrainD_A/', dataset, metric, 'R18T_NetVLAD_BUTF.csv'];
% data_4.second_prefx = '+BUTF ';
% data_4.third = ['data/RGBtrainD_A/', dataset, metric, 'R18T_NetVLAD_BUTF_night.csv'];
% data_4.third_prefx = '+BUTF+Night ';
% data_4.fourth = ['data/RGBtrainD_A/', dataset, metric, 'R18T_NetVLAD_HALL.csv'];
% data_4.fourth_prefx = '+HALL ';

to_print = {data_3, data_2, data_1};

figure();
hold on;
legend_list = {};
for i=1:length(to_print)
    if isfield(to_print{i}, 'first')
        d = csvread(to_print{i}.first);
        plot(d, [to_print{i}.color, '--'], 'MarkerIndices', MarkerIndices)
        legend_list{end+1} = [to_print{i}.name, to_print{i}.first_prefx, to_print{i}.pref];
    end
   
    if isfield(to_print{i}, 'second')
        d = csvread(to_print{i}.second);
        plot(d, [to_print{i}.color, '-o'], 'MarkerIndices', MarkerIndices)
        legend_list{end+1} = [to_print{i}.name, to_print{i}.second_prefx, to_print{i}.pref];
    end
    
    if isfield(to_print{i}, 'third')
        d = csvread(to_print{i}.third);
        plot(d, [to_print{i}.color, '-*'], 'MarkerIndices', MarkerIndices)
        legend_list{end+1} = [to_print{i}.name, to_print{i}.third_prefx, to_print{i}.pref];
    end
    
    if isfield(to_print{i}, 'fourth')
        d = csvread(to_print{i}.fourth);
        plot(d, [to_print{i}.color, '-x'], 'MarkerIndices', MarkerIndices)
        legend_list{end+1} = [to_print{i}.name, to_print{i}.fourth_prefx, to_print{i}.pref];
    end
end
legend(legend_list)
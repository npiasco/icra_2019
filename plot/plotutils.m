clear all;
close all;
clc;

%dataset = 'Results_snow_queries/';
%dataset = 'Results_lt_queries/';
%dataset = 'Results_night_queries/';
dataset = 'Results_default/';

%metric = 'distance/';
metric = 'recall/';
MarkerIndices = [1, 2, 3, 4, 5, 10, 15, 20, 25];

data_1 = struct;
data_1.name = 'MAC';
data_1.pref = '(A)';
data_1.color = 'r';
data_1.first = ['data/RGB/', dataset, metric, 'A_MAC.csv'];
data_1.first_prefx = ' ';
data_1.second = ['data/RGBtrainD_A/', dataset, metric, 'A_MAC_BUTF.csv'];
data_1.second_prefx = '+BUTF ';
data_1.third = ['data/RGBtrainD_A/', dataset, metric, 'A_MAC_HALL.csv'];
data_1.third_prefx = '+HALL ';

data_2 = struct;
data_2.name = 'MAC';
data_2.pref = '(R18)';
data_2.color = 'm';
data_2.first = ['data/RGB/', dataset, metric, 'R18_MAC.csv'];
data_2.first_prefx = ' ';
data_2.second = ['data/RGBtrainD_A/', dataset, metric, 'R18_MAC_BUTF.csv'];
data_2.second_prefx = '+BUTF ';
%data_2.third = ['data/RGBtrainD_A/', dataset, metric, 'R18_MAC_HALL.csv'];
%data_2.third_prefx = '+HALL ';

data_3 = struct;
data_3.name = 'NetVLAD';
data_3.pref = '(A)';
data_3.color = 'b';
data_3.first = ['data/RGB/', dataset, metric, 'A_NetVLAD.csv'];
data_3.first_prefx = ' ';
data_3.second = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_BUTF.csv'];
data_3.second_prefx = '+BUTF ';
data_3.third = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_HALL.csv'];
data_3.third_prefx = '+HALL ';


% 
% data_1.netvlad_butf = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_BUTF.csv'];
% 
% 
% data_1.second = ['data/RGB/', dataset, metric, 'A_NetVLAD.csv'];
% 
% data_2 = struct;
% data_2.name = 'Resnet18';
% data_2.pref = '(R18)';
% data_2.color = 'm';
% data_2.mac = ['data/RGB/', dataset, metric, 'R18_MAC.csv'];
% data_2.netvlad = ['data/RGB/', dataset, metric, 'R18T_NetVLAD.csv'];
% data_2.mac_butf = ['data/RGBtrainD_A/', dataset, metric, 'R18_MAC_BUTF.csv'];
% %data_2.netvlad_butf = ['data/RGBtrainD_A/', dataset, metric, 'R18_NetVLAD_BUTF.csv'];

to_print = {data_1, data_2, data_3};

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
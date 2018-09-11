clear all;
close all;
clc;

dataset = 'Results_snow_queries/';
dataset = 'Results_lt2_queries/';
dataset = 'Results_night_queries/';
dataset = 'Results_default/';
root = 'data/RGBtrainD_A/';
metrics = {'distance/'}%, 'recall/'};
metrics = {'recall/'}%, 'recall/'};
%metric = 'recall/';

data_1 = struct;
data_1.name = 'RGB';
data_1.pref = ' (A)';
data_1.color = 'r';
data_1.first = 'A_MAC_BUTF.csv';
data_1.first_prefx = 'tD (our) + MAC';
data_1.second = 'A_MAC_HALL.csv';
data_1.second_prefx = 'tD (hall) + MAC';
%data_1.third = 'A_BUTF_MAC_ots_night.csv';
%data_1.third_prefx = '+HALL+Night ';
data_1.fourth = 'A_MAC.csv';
data_1.fourth_prefx = '+ MAC ';

data_2 = struct;
data_2.name = 'RGB';
data_2.pref = ' (R)';
data_2.color = 'm';
data_2.first = 'R18_MAC_BUTF.csv';
data_2.first_prefx = 'tD (our) + MAC';
data_2.fourth = 'R18_MAC.csv';
data_2.fourth_prefx = ' + MAC';
% data_2.third = 'R18_BUTF_MAC_ots_night.csv';
% data_2.third_prefx = '+BUTF+Night ';
% data_2.fourth = 'R18_MAC_HALL.csv';
% data_2.fourth_prefx = '+HALL ';

data_3 = struct;
data_3.name = 'RGB';
data_3.pref = ' (A)';
data_3.color = 'b';
data_3.fourth = 'A_NetVLAD.csv';
data_3.fourth_prefx = ' + NetVLAD';
data_3.first = 'A_2NetVLAD_BUTF.csv';
data_3.first_prefx = 'tD (our) + NetVLAD';
% data_3.third = ['data/RGBtrainD_A/', dataset, metric, 'A_NetVLAD_BUTF_night.csv'];
% data_3.third_prefx = '+BUTF+Night ';
data_3.second = 'A_NetVLAD_HALL.csv';
data_3.second_prefx = 'tD (hall) + NetVLAD';

data_4 = struct;
data_4.name = 'RGB';
data_4.pref = ' (Rt)';
data_4.color = 'c';
data_4.fourth = 'R18T_NetVLAD.csv';
data_4.fourth_prefx = ' + NetVLAD';
data_4.first= 'R18T_2NetVLAD_BUTF.csv';
data_4.first_prefx = 'tD (our) + NetVLAD';
% data_4.third = 'R18T_NetVLAD_BUTF_night.csv';
% data_4.third_prefx = '+BUTF+Night ';
% data_4.fourth = 'R18T_NetVLAD_HALL.csv';
% data_4.fourth_prefx = '+HALL ';

data_trunc_vlad = struct;
data_trunc_vlad.name = 'RGB + NetVLAD';
data_trunc_vlad.pref = '';
data_trunc_vlad.color = 'b';
data_trunc_vlad.first = 'R18T_NetVLAD.csv';
data_trunc_vlad.first_prefx = ' (Rt)';
data_trunc_vlad.fourth = 'R18_NetVLAD.csv';
data_trunc_vlad.fourth_prefx = ' (R)';
% data_4.second = 'R18T_NetVLAD_BUTF.csv';
% data_4.second_prefx = '+BUTF ';
% data_4.third = 'R18T_NetVLAD_BUTF_night.csv';
% data_4.third_prefx = '+BUTF+Night ';
% data_4.fourth = 'R18T_NetVLAD_HALL.csv';
% data_4.fourth_prefx = '+HALL ';

night_val = struct
night_val.name = 'RGB';
night_val.pref = ' (A)';
night_val.color = 'r';
night_val.first = 'A_MAC_BUTF_(n).csv';
night_val.first_prefx = 'tD + MAC, night fine tuning';
%night_val.second = 'A_MAC_BUTF.csv';
%night_val.second_prefx = 'tD (our) + MAC';
%data_1.third = 'A_BUTF_MAC_ots_night.csv';
%data_1.third_prefx = '+HALL+Night ';
night_val.fourth = 'A_MAC.csv';
night_val.fourth_prefx = '+ MAC ';

night_val2 = struct
night_val2.name = 'RGB';
night_val2.pref = ' (R)';
night_val2.color = 'm';
night_val2.first = 'R18_MAC_BUTF_(n).csv';
night_val2.first_prefx = 'tD + MAC, night fine tuning';
night_val2.fourth = 'R18_MAC.csv';
night_val2.fourth_prefx = '+ MAC ';

night_val3 = struct
night_val3.name = 'RGB';
night_val3.pref = ' (A)';
night_val3.color = 'b';
night_val3.first = 'A_2NetVLAD_BUTF_(n).csv';
night_val3.first_prefx = 'tD + NetVALD, night fine tuning';
night_val3.fourth = 'A_NetVLAD.csv';
night_val3.fourth_prefx = '+ NetVALD ';

night_val4 = struct
night_val4.name = 'RGB';
night_val4.pref = ' (Rt)';
night_val4.color = 'c';
night_val4.first = 'R18T_2NetVLAD_BUTF_(n).csv';
night_val4.first_prefx = 'tD + NetVALD, night fine tuning';
night_val4.fourth = 'R18T_NetVLAD.csv';
night_val4.fourth_prefx = '+ NetVALD ';


data = struct;
data.name = 'RGB';
data.pref = ' (A)';
data.color = 'r';
data.first = 'A_MAC_BUTF.csv';
data.first_prefx = 'tD (our) + MAC';
data.second = 'A_MAC_BUTF_noD_dec.csv';
data.second_prefx = '+ + MAC';
%data_1.third = 'A_BUTF_MAC_ots_night.csv';
%data_1.third_prefx = '+HALL+Night ';
data.fourth = 'A_MAC.csv';
data.fourth_prefx = '+ MAC ';

to_print = {data_4,data_3,data_2,data_1};

for j=1:length(metrics)
    metric = metrics{j};
    if strcmp(metric, 'distance/')
        figure(1);
        %subplot(1,2,1);
        grid();
        hold on;
        x_axis = 15:1:50;
        MarkerIndices = 1:5:length(x_axis);
        x_name = 'D - Distance to top 1 candidate (m)';
        y_name = 'Recall@D (%)';
    else
        figure(1);
        %subplot(1,2,2);
        grid();
        hold on;
        MarkerIndices = [1, 2, 3, 4, 5, 10, 15, 20, 25];
        x_axis = 1:1:25;
        x_name = 'N - Number of top database candidates';
        y_name = 'Recall@N (%)';
    end
    legend_list = {};
    for i=1:length(to_print)    
        if isfield(to_print{i}, 'first')
            d = csvread([root, dataset, metric, to_print{i}.first]);
            plot(x_axis, d(x_axis), [to_print{i}.color, '-o'], 'MarkerIndices', MarkerIndices, 'MarkerSize', 12)
            legend_list{end+1} = [to_print{i}.name, to_print{i}.first_prefx, to_print{i}.pref];
        end

        if isfield(to_print{i}, 'second')
            d = csvread([root, dataset, metric, to_print{i}.second]);
            plot(x_axis, d(x_axis), [to_print{i}.color, '-x'], 'MarkerIndices', MarkerIndices, 'MarkerSize', 12)
            legend_list{end+1} = [to_print{i}.name, to_print{i}.second_prefx, to_print{i}.pref];
        end

        if isfield(to_print{i}, 'third')
            d = csvread([root, dataset, metric, to_print{i}.third]);
            plot(x_axis, d(x_axis), [to_print{i}.color, '-*'], 'MarkerIndices', MarkerIndices, 'MarkerSize', 12)
            legend_list{end+1} = [to_print{i}.name, to_print{i}.third_prefx, to_print{i}.pref];
        end

        if isfield(to_print{i}, 'fourth')
            d = csvread([root, dataset, metric, to_print{i}.fourth]);
            plot(x_axis, d(x_axis), [to_print{i}.color, '--'])
            legend_list{end+1} = [to_print{i}.name, to_print{i}.fourth_prefx, to_print{i}.pref];
        end
    end
    %legend(legend_list, 'location', 'southeast')
    xlabel(x_name)
    ylabel(y_name)

%     ax = gca;
%     outerpos = ax.OuterPosition;
%     ti = ax.TightInset; 
%     if strcmp(metric, 'distance/')
%         left = outerpos(1) + ti(1)/2;
%         ax_width = outerpos(3);
%     else
%         left = outerpos(1) + ti(1)*1.5;
%         ax_width = outerpos(3) - ti(1);
%     end
%     bottom = outerpos(2) + ti(2);
%     ax_height = outerpos(4) - ti(2) - ti(4);
%     ax.Position = [left bottom ax_width ax_height];    
end
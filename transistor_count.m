% Specify the Excel file path
filepath = 'transistor_count.xlsx';

% Read data from sheet 1
sheet1 = 9;
sheet2 = 2;
sheet3 = 3;
sheet4 = 4;
sheet5 = 5;
sheet6 = 6;
sheet7 = 10;
sheet8 = 8;

% Read the data from columns A, B, and C
data1 = xlsread(filepath, sheet1, 'B:C');
name1 = readcell(filepath, 'Sheet', sheet1, 'Range', 'A:A');

data2 = xlsread(filepath, sheet2, 'B:C');
name2 = readcell(filepath, 'Sheet', sheet2, 'Range', 'A:A');

data3 = xlsread(filepath, sheet3, 'B:C');
name3 = readcell(filepath, 'Sheet', sheet3, 'Range', 'A:A');

data4 = xlsread(filepath, sheet5, 'B:C');
name4 = readcell(filepath, 'Sheet', sheet5, 'Range', 'A:A');

data5 = xlsread(filepath, sheet6, 'B:C');
name5 = readcell(filepath, 'Sheet', sheet6, 'Range', 'A:A');

data6 = xlsread(filepath, sheet7, 'B:C');
name6 = readcell(filepath, 'Sheet', sheet7, 'Range', 'A:A');

data7 = xlsread(filepath, sheet8, 'B:C');
name7 = readcell(filepath, 'Sheet', sheet8, 'Range', 'A:A');

% Extract columns
transistor1 = data1(:, 1);
% transistor1 = log10(transistor1);
year1 = data1(:, 2);

transistor2 = data2(:, 1);
% transistor2 = log10(transistor2);
year2 = data2(:, 2);

transistor3 = data3(:, 1);
% transistor3 = log10(transistor3);
year3 = data3(:, 2);

transistor4 = data4(:, 1);
% transistor4 = log10(transistor4);
year4 = data4(:, 2);

transistor5 = data5(:, 1);
% transistor5 = log10(transistor5);
year5 = data5(:, 2);

transistor6 = data6(:, 1);
% transistor6 = log10(transistor6);
year6 = data6(:, 2);

transistor7 = data7(:, 1);
% transistor7 = log10(transistor7);
year7 = data7(:, 2);

% Create scatter plot
% figure()
sz = 60;
scatter(year1, transistor1, sz, 'o', 'filled', 'MarkerFaceColor', [0.3059, 0.4745, 0.6549]);
hold on;
scatter(year2, transistor2, sz, 's', 'filled', 'MarkerFaceColor', [0.9490, 0.5569, 0.1686]);
hold on;
scatter(year3, transistor3, sz, 'd', 'filled', 'MarkerFaceColor', [0.8824, 0.3412, 0.3490]);
hold on;
scatter(year4, transistor4, sz, '^', 'filled', 'MarkerFaceColor', [0.4627, 0.7176, 0.6980]);
hold on;
scatter(year5, transistor5, sz, 'o', 'filled', 'MarkerFaceColor', [0.3490, 0.6314, 0.3098]);
hold on;
scatter(year6, transistor6, sz, 's', 'filled', 'MarkerFaceColor', [0.9294, 0.7882, 0.2824]);
hold on;
scatter(year7, transistor7, sz, 'v', 'filled', 'MarkerFaceColor', [0.6902, 0.4784, 0.6314]);
hold on;

hTitle = title('Processor Transistor Count Over Time');
hXLabel = xlabel('Year');
hYLabel = ylabel('Number of Transistors');
set(gca, 'Box', 'on', ...                                         % 边框
         'XGrid', 'off', 'YGrid', 'off');              % 小刻度         
%          'XTick', 0:40:160,...                                  % 坐标区刻度、范围
%          'YTick', 0:40:160,...

% set(gca, 'TickDir', 'in', 'TickLength', [.015 .015]); % 小刻度 
% set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XLim', [2009 2024]);
set(gca, 'YLim', [10^9 10^11.3]);
set(gca, 'YScale', 'log');
set(gca, 'XColor', [.1 .1 .1], 'YColor', [.1 .1 .1]);            % 坐标轴颜色      
set(gca, 'FontName', 'Helvetica');
set([hXLabel, hYLabel], 'FontName', 'AvantGarde');
set(gca, 'FontSize', 15);
set([hXLabel, hYLabel], 'FontSize', 18);
set(hTitle, 'FontSize', 20, 'FontWeight' , 'bold');

hold on;

% Add processor names
fs = 10;

for i = 1:length(year1)
    label = text(year1(i), transistor1(i), name1(i+1), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', fs);
end

hold on;

for i = 1:length(year2)
    text(year2(i), transistor2(i), name2{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', fs);
end

hold on;

for i = 1:length(year3)
    text(year3(i), transistor3(i), name3{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', fs);
end

hold on;

for i = 1:length(year4)
    text(year4(i), transistor4(i), name4{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', fs);
end

for i = 1:length(year5)
    text(year5(i), transistor5(i), name5{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', fs);
end

for i = 1:length(year6)
    text(year6(i), transistor6(i), name6{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', fs);
end

for i = 1:length(year7)
    text(year7(i), transistor7(i), name7{i+1}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', fs);
end

hold on;

legend('Microprocessor', 'GPU', 'FPGA', 'Network Chip', 'ADAS', 'AI Chip', 'DPU', 'Location', 'northwest');
legend('FontSize', 15); 

% Adjust figure size
fig = gcf;
fig.Position = [0, 0, 1500, 1000];

saveas(gcf, 'transistor_count.png', 'png');

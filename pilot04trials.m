% Script for response to reviewers for Bounyarith et al. 2024 PCI-RR Revision 1
% Written June 21st 2024 by Tiara Bounyarith 

% Looking at the number of trials pilot-04 completed to justify study
% design

% This script generates a graph showing the breakdown of brain-triggered
% vs. time-out trials pilot-04 completed in each run.


%% Load in data

data_dir = '/Users/tuk54040/Desktop/PreprintSimulations/pilot-04'


runs = {'1', '2', '3', '4', '5', '6'};


%Cell array for runs data
pilot04Data = cell(1, length(runs));

for i=1:length(runs)
    pilot04data = load([data_dir filesep 'Data_Run_' runs{i} filesep 'NF_Data_' runs{i} filesep 'pilot-04_' runs{i} '_P.mat']);
    pilot04data = pilot04data.eventType;
    pilot04Data{i} = pilot04data;
end    

%% How many brain triggered trials did pilot-04 complete per run?

% Cell array for brain-triggered trials

pilot04BrainTrigCount = cell(1, length(pilot04Data));

% Get number of brain-triggered trials per run (1s)

for i=1:length(pilot04Data)
   braintrig = length(find([pilot04Data{i}==1]));
   pilot04BrainTrigCount{i} = braintrig;
end    

%% How many time-out trials did pilot-04 complete?

% Cell array for time-out trials

pilot04TimeOutCount = cell(1, length(pilot04Data));

% Get number of time-out trials per run (1s)

for i=1:length(pilot04Data)
   timeout = length(find([pilot04Data{i}==2]));
   pilot04TimeOutCount{i} = timeout;
end  

%% Graph

% Convert cells to numericals

num_BrainTrig = cell2mat(pilot04BrainTrigCount);
num_TimeOut = cell2mat(pilot04TimeOutCount);

% Make matrix for plot

barplotdata = [num_TimeOut; num_BrainTrig]';


% Make plot

figure,
pilot04plot = bar(barplotdata, 'stacked');

colors = jet(size(barplotdata, 2));

for k = 1:size(barplotdata, 2)
    pilot04plot(k).FaceColor = colors(k, :);
end 

xlabel('Runs', 'FontSize', 30, 'FontWeight', 'bold');
ylabel('Number of total trials completed per run', 'FontSize', 30, 'FontWeight', 'bold');
legend({'Time-out null trials', 'Brain-triggered trials'}, 'FontSize', 20);
title('Number of trials pilot subject completed per run by trial-type', 'FontSize', 30);

xticks(1:6);
xticklabels({'Run 1', 'Run 2', 'Run ', 'Run 4', 'Run 5', 'Run 6'});

ax = gca;

ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;

%% Sums and means 


sumBrainTrig = sum([pilot04BrainTrigCount{1, :}]);
meanBrainTrig = mean([pilot04BrainTrigCount{1, :}]);

sumTimeOut = sum([pilot04TimeOutCount{1, :}]);
meanTimeOut = mean([pilot04TimeOutCount{1, :}]);

sumAllTrials = sumBrainTrig + sumTimeOut;










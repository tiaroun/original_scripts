% Script for response to reviewers for Bounyarith et al. 2024 PCI-RR Revision 1
% Written June 20th 2024 by Tiara Bounyarith

% Looking at how many events are triggered in a single pilot's simulated runs with different version of
% triggering algorithm: one that requires an increase of 2 TRs, another of
% 3 TRs, another of 4 TRs, and another of 5 TRs.

% This script generates a graph showing comparisons of the number of
% brain-triggered trials (daIC or PMC) each version of the algorithm
% triggered.

%% Load in data

data_dir = '/Users/tuk54040/Desktop/PreprintSimulations/algorithm_simulation_outputs';

% Get list of algorithm version

algorithmver = dir([data_dir filesep 'pilot-04_*']);
algorithmver = {algorithmver.name};


% Create list of runs (Run 1 is simulation done with PMC, Run 2 is
% simulation done with daIC)

runs = {'1', '2'};

% Create cell array to store trials

AllTimeSeries = cell(1, length(algorithmver));

for i=1:length(algorithmver)
    timeSeries = cell(1, length(runs));
   for j=1:length(runs)
       timeseries = load([data_dir filesep algorithmver{i} filesep 'Data_Run_' runs{j} filesep 'NF_Data_1' filesep 'pilot-04_1_P.mat']);
       timeseries = timeseries.eventType;
       timeSeries{j} = timeseries;
   end
   
    AllTimeSeries{i} = timeSeries;
end

%% How many brain-triggered trials were triggered with each algorithm version?

% Create cell array to store trial numbers

AllTrialCounts = cell(1, length(algorithmver));

for i=1:length(AllTimeSeries)
    allTrials = cell(1, length(runs));
    for j=1:length(runs)
        alltrials = length(find(AllTimeSeries{i}{j} == 1));
        allTrials{j} = alltrials;
    end
    AllTrialCounts{i} = allTrials;
end


%% How many time-out trials?

AllTimeOut = cell(1, length(AllTimeSeries));


for i=1:length(AllTimeSeries)
    allTimeOut = cell(1, length(runs));
    for j=1:length(runs)
        alltimeout = length(find(AllTimeSeries{i}{j} == 2));
        allTimeOut{j} = alltimeout;
    end
    AllTimeOut{i} = allTimeOut;
end

%% How many brain-triggered trials were in the PMC simulation, specifically?

PMCTrialCounts = cell(1, length(AllTrialCounts));

for i=1:length(AllTrialCounts)
    pmctrialcounts = [AllTrialCounts{i}{1, 1}];
    PMCTrialCounts{i} = pmctrialcounts;
    
end 


%% How many brain-triggered trials were in the daIC simulation, specifically?

daICTrialCounts = cell(1, length(AllTrialCounts));

for i=1:length(AllTrialCounts)
   daictrialcounts = [AllTrialCounts{i}{1, 2}];
   daICTrialCounts{i} = daictrialcounts;
end    


%% Graph

%Convert cells to numerical doubles
num_PMCTrialCounts = cell2mat(PMCTrialCounts);
num_daICTrialCounts = cell2mat(daICTrialCounts);

%Create a matrix to plot (and transpose)
barplotdata = [num_PMCTrialCounts; num_daICTrialCounts]';

%Set color scheme
colormap(winter);

%Make a barplot
figure;
algorithmplot = bar(barplotdata);

  %Set colors
colors = winter(size(barplotdata, 2));

for k = 1:size(barplotdata, 2)
    algorithmplot(k).FaceColor = colors(k, :);
end    

xlabel('Number of increasing TRs the algorithm required to trigger a trial', 'FontSize', 30, 'FontWeight', 'bold');
ylabel('Number of trials triggered by algorithm', 'FontSize', 30, 'FontWeight', 'bold');
legend({'Posteromedial cortex-triggered', 'Dorsal anterior insular cortex-triggered'}, 'FontSize', 25);
title('Comparison of number of trials triggered by different algorithm versions', 'FontSize', 35);

xticks(1:4);
xticklabels({'2 TRs', '3 TRs', '4 TRs', '5 TRs'});

ax = gca;

ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;




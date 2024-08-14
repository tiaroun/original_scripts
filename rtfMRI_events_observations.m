% Script for response to reviewers for Bounyarith et al. 2024 PCI-RR Revision 1
% Written June 12th 2024 by Tiara Bounyarith

% Script for observing the number of time-out trials, brain-triggered
% trials, and total trials of every run (6 runs) for each subject (n = 15)

% This script generates a graph showing the total number of each trial type
% (daIC, PMC, time-out) each subject completed across all 6 runs.

% This script generates several data arrays of interest:
%   - TotalSubTrials tells us how many total trials each subject completed
%   - TotalBrainTrigCounts tells us how many of these total trials were
%     triggered by brain activity.
%   - TotalTimeOutCounts tells us how many of these total trials were
%     time-out, "null" trials.
%
%   - daIC_BrainTrigCounts_all tells us how many total daIC-triggered
%     trials were completed by each subject (NOTE: not organized by subject
%     due to the way I had to code calculating events based on ROI type)
%   - PMC_BrainTrigCounts_all tells us how many total PMC-triggered
%     trials were completed by each subject (NOTE: not organized by subject
%     due to the way I had to code calculating events based on ROI type)
%
%   - TotalRunCounts tells us how many trials per run each subject
%     completed.
%   - BrainTrigCounts tells us how many of these trials per run were
%     triggered by brain activity.
%   - TimeOutCounts tells us how many of these trials per run were
%     time-out, "null" trials.
%
%   - Mean_TotalSubTrials tells us that, across all subjects, the average
%     number of total trials completed was 35.
%   - Mean_TotalBrainTrigCounts tells us that, across all subjects, the
%     average number of brain-triggered trials completed was about 29.
%   - Mean_TotalTimeOutCounts tells us that, across all subjects, the
%     average number of time-out, "null" trials completed was about 6.

%% Load in data! %%

% The data is organized so that each subject folder consists of six .mat
% files (sub-[sub ID]_[run number]_P.mat), where each file is the data
% output for a single run.

data_dir = '/Users/tuk54040/Desktop/PreprintSimulations/rtfMRI_event_observations/Subjects';

% Get list of subjects
subs=dir([data_dir filesep 'sub-*']);
subs={subs.name};

% Create object with the number of runs 
runs = {'1' '2' '3' '4' '5' '6'};


% Create an empty cell for each subject's time series data to be stored in
TimeSeries = cell(1, length(subs));


%Loop through each run of each subject to extract the eventType time series
for i=1:length(subs)
    timeSeries = cell(1, length(runs));
    
    for j=1:length(runs) 
        data = load([data_dir filesep subs{i} filesep subs{i} '_' runs{j} '_P.mat']);
        timeseries = data.eventType;
        timeSeries{j} = timeseries';   
    end
    
    TimeSeries{i} = timeSeries;

end

% The main data cell array of interest for looking at each subjects' run time
% series is "TimeSeries"!

%% How many time-out events are there in each run of each subject?


%Create cell for number of time out events for each run of every subject
TimeOutCounts = cell(1, length(subs));

%Loop through TimeSeries to calculate number of time out events ('2's) in
%each time series

for i=1:length(TimeSeries)
    run_TimeOut = cell(1, length(runs));
    
    for j=1:length(TimeSeries{i})
        run_timeOut = length(find(TimeSeries{i}{j} == 2));
        run_TimeOut{j} = run_timeOut';
    end
    
    TimeOutCounts{i} = run_TimeOut;
end

% The main data cell array of interest for looking at the number of
% time-out trials per run for each subject is "TimeOutCounts"!

%% What is the total number of time-out trials each subject completed?

% Create cell for total numbers of time-out trials completed by each
% subject
TotalTimeOutCounts = cell(1, length(subs));

% Loop through TimeOutCounts to calculate total time-out trials for each
% subject

for i=1:length(TimeOutCounts)
    run_totalTimeOut = sum([TimeOutCounts{i}{1,:}]);
    TotalTimeOutCounts{i} = run_totalTimeOut';
end

% The main data cell array of interest for looking at the total number of
% time-out trials for each subject is "TotalTimeOutCounts"!

%% What is the mean number of time-out trials completed by subjects?

Mean_TotalTimeOutCounts = mean([TotalTimeOutCounts{:}])

% Mean total time-out trial count is 5.8 trials.

%% How many brain-triggered events are there in each run of each subject?


%Create cell for number of brain triggered events for each run of every subject
BrainTrigCounts = cell(1, length(subs));

%Loop through TimeSeries to calculate number of brain-triggered events ('1's) in
%each time series

for i=1:length(TimeSeries)
    run_BrainTrig = cell(1, length(runs));
    
    for j=1:length(TimeSeries{i})
        run_brainTrig = length(find(TimeSeries{i}{j} == 1));
        run_BrainTrig{j} = run_brainTrig';
    end
    
    BrainTrigCounts{i} = run_BrainTrig;
end

% The main data cell array of interest for looking at the number of
% time-out trials per run for each subject is "TimeOutCounts"!

%% Labeling runs by ROI counterbalance (an attempt)



% ROI_labels = {'2' '2' '1' '2' '1' '1' '2' '1' '2' '2' '2' '1' '1' '1' '1'}
% 
% ROI_BrainTrigCounts = [BrainTrigCounts; ROI_labels];
% 
% Create cell arrays for total daIC and PMC trials for subjects who had the
% counterbalance order of 1 (aka. daIC was the starting ROI)
% 
% daIC_BrainTrigCounts_cb1 = cell(1, length(find([ROI_BrainTrigCounts{2,:}] == '1')));
% PMC_BrainTrigCounts_cb1 = cell(1, length(find([ROI_BrainTrigCounts{2,:}] == '1')));
% 
% Create cell arrays for total daIC and PMC trials for subjects who had the
% counterbalance order of 2 (aka. PMC was the starting ROI)
% PMC_BrainTrigCounts_cb2 = cell(1, length(find([ROI_BrainTrigCounts{2,:}] == '2')));
% daIC_BrainTrigCounts_cb2 = cell(1, length(find([ROI_BrainTrigCounts{2,:}] == '2')));
% 
% Loop through ROI_BrainTrigCounts to find 
% for i=1:length(ROI_BrainTrigCounts)
%     run_daICtrigs_cb1 = []; run_PMCtrigs_cb1 = []; run_PMCtrigs_cb2 = []; run_daICtrigs_cb2 = []; 
%     if ROI_BrainTrigCounts{2, i} == '1'
%        run_daICtrigs_cb1 = sum([ROI_BrainTrigCounts{i}{1,1}, ROI_BrainTrigCounts{i}{1,3}, ROI_BrainTrigCounts{i}{1,5}]);
%        daIC_BrainTrigCounts_cb1{i} = run_daICtrigs_cb1';
%        run_PMCtrigs_cb1 = sum([ROI_BrainTrigCounts{i}{1,2}, ROI_BrainTrigCounts{i}{1,4}, ROI_BrainTrigCounts{i}{1,6}]);
%        PMC_BrainTrigCounts_cb1{i} = run_PMCtrigs_cb1';
%     elseif ROI_BrainTrigCounts{2, i} == '2'
%        run_PMCtrigs_cb2 = sum([ROI_BrainTrigCounts{i}{1,1}, ROI_BrainTrigCounts{i}{1,3}, ROI_BrainTrigCounts{i}{1,5}]);
%        PMC_BrainTrigCounts_cb2{i} = run_PMCtrigs_cb2';
%        run_daICtrigs_cb2 = sum([ROI_BrainTrigCounts{i}{1,2}, ROI_BrainTrigCounts{i}{1,4}, ROI_BrainTrigCounts{i}{1,6}]);
%        daIC_BrainTrigCounts_cb2{i} = run_daICtrigs_cb2';
%     end
% end



%% the previous section didn't work so this one incorporates advice from chatgpt...


ROI_labels = {'2' '2' '1' '2' '1' '1' '2' '1' '2' '2' '2' '1' '1' '1' '1'}

ROI_BrainTrigCounts = [BrainTrigCounts; ROI_labels];

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 1
num_cb1 = sum(strcmp(ROI_labels, '1'));
daIC_BrainTrigCounts_cb1 = cell(1, num_cb1);
PMC_BrainTrigCounts_cb1 = cell(1, num_cb1);

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 2
num_cb2 = sum(strcmp(ROI_labels, '2'));
PMC_BrainTrigCounts_cb2 = cell(1, num_cb2);
daIC_BrainTrigCounts_cb2 = cell(1, num_cb2);

% Initialize counters for indexing into cb1 and cb2 arrays
index_cb1 = 1;
index_cb2 = 1;

% Loop through ROI_BrainTrigCounts to find and sum triggers
for i = 1:size(ROI_BrainTrigCounts, 2)
    if strcmp(ROI_BrainTrigCounts{2, i}, '1')
        % Sum daIC and PMC trigger counts for counterbalance order 1
        run_daICtrigs_cb1 = sum([ROI_BrainTrigCounts{1, i}{1, 1}, ROI_BrainTrigCounts{1, i}{1, 3}, ROI_BrainTrigCounts{1, i}{1, 5}]);
        daIC_BrainTrigCounts_cb1{index_cb1} = run_daICtrigs_cb1';
        run_PMCtrigs_cb1 = sum([ROI_BrainTrigCounts{1, i}{1, 2}, ROI_BrainTrigCounts{1, i}{1, 4}, ROI_BrainTrigCounts{1, i}{1, 6}]);
        PMC_BrainTrigCounts_cb1{index_cb1} = run_PMCtrigs_cb1';
        index_cb1 = index_cb1 + 1;
    elseif strcmp(ROI_BrainTrigCounts{2, i}, '2')
        % Sum PMC and daIC trigger counts for counterbalance order 2
        run_PMCtrigs_cb2 = sum([ROI_BrainTrigCounts{1, i}{1, 1}, ROI_BrainTrigCounts{1, i}{1, 3}, ROI_BrainTrigCounts{1, i}{1, 5}]);
        PMC_BrainTrigCounts_cb2{index_cb2} = run_PMCtrigs_cb2';
        run_daICtrigs_cb2 = sum([ROI_BrainTrigCounts{1, i}{1, 2}, ROI_BrainTrigCounts{1, i}{1, 4}, ROI_BrainTrigCounts{1, i}{1, 6}]);
        daIC_BrainTrigCounts_cb2{index_cb2} = run_daICtrigs_cb2';
        index_cb2 = index_cb2 + 1;
    end
end

%% Assigning sub-IDs to daIC_BrainTrigCounts_cb1, PMC_BrainTrigCounts_cb1,daIC_BrainTrigCounts,cb2, and PMC_BrainTrigCounts_cb2

subs_cb1 = {'sub-03' 'sub-05' 'sub-06' 'sub-09' 'sub-16' 'sub-17' 'sub-18' 'sub-19'};
subs_cb2 = {'sub-01' 'sub-02' 'sub-04' 'sub-07' 'sub-11' 'sub-14' 'sub-15'};

daIC_BrainTrigCounts_cb1 = [subs_cb1; daIC_BrainTrigCounts_cb1];
PMC_BrainTrigCounts_cb1 = [subs_cb1; PMC_BrainTrigCounts_cb1];

daIC_BrainTrigCounts_cb2 = [subs_cb2; daIC_BrainTrigCounts_cb2];
PMC_BrainTrigCounts_cb2 = [subs_cb2; PMC_BrainTrigCounts_cb2];

%% Create and sort cell for sums of all total daIC trials / PMC trials across all subs

%daIC

daIC_BrainTrigCounts_all = [daIC_BrainTrigCounts_cb1, daIC_BrainTrigCounts_cb2];

daic_subs = daIC_BrainTrigCounts_all(1, :);

[sorteddaICsubs, sortOrder] = sort(daic_subs);

sorteddaICtrials = daIC_BrainTrigCounts_all(2, sortOrder);

daIC_BrainTrigCounts_all = sorteddaICtrials; 
%now that the trials are ordered according to numerical subject ID, we can
%remove the subject ID row

%PMC

PMC_BrainTrigCounts_all = [PMC_BrainTrigCounts_cb1, PMC_BrainTrigCounts_cb2];

pmc_subs = PMC_BrainTrigCounts_all(1,:);

[sortedPMCsubs, sortOrder] = sort(pmc_subs);

sortedPMCtrials = PMC_BrainTrigCounts_all(2, sortOrder);

PMC_BrainTrigCounts_all = sortedPMCtrials;

%% What is the mean number of daIC-triggered trials across subjects?

Mean_daIC_all = mean([daIC_BrainTrigCounts_all{1,:}])

%% What is the mean number of PMC-triggered trials across subjects?

Mean_PMC_all = mean([PMC_BrainTrigCounts_all{1,:}]) 

%% What is the total number of brain-triggered trials each subject completed?

% Create cell for total numbers of brain-triggered trials completed by each
% subject
TotalBrainTrigCounts = cell(1, length(subs));

% Loop through BrainTrigCounts to calculate total brain-triggered trials for each
% subject

for i=1:length(BrainTrigCounts)
    run_totalBrainTrig = sum([BrainTrigCounts{i}{1,:}]);
    TotalBrainTrigCounts{i} = run_totalBrainTrig';
end

% The main data cell array of interest for looking at the total number of
% brain-triggered trials for each subject is "TotalBrainTrigCounts"!

%% What is the mean number of brain-triggered trials completed by subjects?

Mean_TotalBrainTrigCounts = mean([TotalBrainTrigCounts{:}])

%Mean total brain-triggered trial count is 29 trials.

%% How many total trials (either brain-triggered or time-out) are there in each run of each subject?

% Create cell for number of total trials per run
TotalRunCounts = cell(1, length(subs));

%Loop through TimeSeries to calculate the sum of brain-triggered events
%(1s) and time-out events (2s) in each time series

for i=1:length(TimeSeries)
    run_Total = cell(1, length(runs));
    
    for j=1:length(TimeSeries{i})
        x = length(find(TimeSeries{i}{j} == 1));
        y = length(find(TimeSeries{i}{j} == 2));
        run_total = x + y;
        run_Total{j} = run_total';
    end       
    
    TotalRunCounts{i} = run_Total;
end


% The main data cell array of interest for looking at the total number of
% trials per run for each subject is "TotalRunCounts"!


%% How many overall trials did each subject complete?

% Create cell for number of total subject trials
TotalSubTrials = cell(1, length(subs));

%Loop through TotalRunCounts to add up all numbers in each cell

for i=1:length(TotalRunCounts)

    subTrials = sum([TotalRunCounts{i}{1,:}]);
    TotalSubTrials{i} = subTrials';

end

% The main data cell array of interest for looking at the total number of
% trials each subject completed is "TotalSubTrials"! 

%% What is the mean number of trials completed by subjects?

Mean_TotalSubTrials = mean([TotalSubTrials{:}])

%Mean_TotalSubTrials = 35 trials


%% Graph the makeup of trial-type per subject

% Convert cell arrays to numerical
num_daICBrainTrigCountsAll = cell2mat(daIC_BrainTrigCounts_all);
num_PMCBrainTrigCountsAll = cell2mat(PMC_BrainTrigCounts_all);
num_TotalTimeOutCounts = cell2mat(TotalTimeOutCounts);

% Make a matrix to prepare for plotting
barplotdata = [num_TotalTimeOutCounts; num_PMCBrainTrigCountsAll; num_daICBrainTrigCountsAll]';


% Set color scheme

colormap(cool); 

% Make a stacked bar plot
figure;
trialtypegraph = bar(barplotdata, 'stacked');

% Set colors
colors = cool(size(barplotdata, 2));
for k = 1:size(barplotdata, 2)
    trialtypegraph(k).FaceColor = colors(k, :);
end

xlabel('Subject', 'FontSize', 30, 'FontWeight', 'bold');
ylabel('Total trial number across all runs', 'FontSize', 30, 'FontWeight', 'bold');
legend({'Time-out null trials', 'Posteromedial cortex-triggered trials',...
    'Dorsal anterior insular cortex-triggered trials'}, 'FontSize', 18);
title('Trial-type make-ups of total trials completed per subject', 'FontSize', 30);


xticks(1:15);
xticklabels({'sub-01', 'sub-02', 'sub-03', 'sub-04', 'sub-05', 'sub-06', 'sub-07', 'sub-09',...
    'sub-11', 'sub-14', 'sub-15', 'sub-16', 'sub-17', 'sub-18', 'sub-19'});

ax = gca;

ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;





%% Add sub-ID labels for data arrays of interest for easier viewing 
% Note: these labels are being added at the very end of this script because
% many of the sections of code above use indexing of these arrays
% 
% BrainTrigCounts = [subs; BrainTrigCounts];
% ROI_labels = [subs; ROI_labels];
% TotalBrainTrigCounts = [subs; TotalBrainTrigCounts];
% TimeOutCounts = [subs; TimeOutCounts];
% TimeSeries = [subs; TimeSeries];
% TotalRunCounts = [subs; TotalRunCounts];
% TotalSubTrials = [subs; TotalSubTrials];
% TotalTimeOutCounts = [subs; TotalTimeOutCounts];

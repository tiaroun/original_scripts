% Script for response to reviewers for Bounyarith et al. 2024 PCI-RR Revision 1
% Written June 13th & 14th 2024 by Tiara Bounyarith

%Script to identify overlapping trials triggered by both real and simulated
%opposite ROIs

%This script generates several data arrays of interest: 
%   - RealTotalBrainTrigCounts tells us the total number of brain-triggered
%     trials per subject.
%   - OverlapEvents tells us the exact time stamps of trials per run that would have been
%     triggered by both the real and the opposite ROI for each subject.
%   - Run_CountOverlap tells us the number of overlapping trials per run
%     for each subject.
%   - Subj_CountOverlap tells us the number of overlapping trials each
%     subject had across all runs.

%This script generates a stacked barplot showing the ratio of
%trials that were distinctly triggered by the real ROI during data
%acquisition to trials that would have also been triggered by the other,
%non-target brain region (as simulated in the opposite ROI simulation). 
%% Load in data! %% 

%Set up directories
data_dir = '/Users/tuk54040/Desktop/PreprintSimulations/opposite_roi_sim';
real_data_dir = [data_dir filesep 'real_data' filesep 'Subjects'];
sim_data_dir = [data_dir filesep 'simulated_data' filesep 'Subjects'];


%Get list of subjects
subs=dir([real_data_dir filesep 'sub-*']);
subs={subs.name};

%Create object with the number of runs
runs = {'1' '2' '3' '4' '5' '6'};

% Create empty cell for real data time series
RealTimeSeries = cell(1, length(subs));


%Loop through each run of each subject's real data to extract real
%eventType time series
for i=1:length(subs)
    realtimeSeries = cell(1, length(runs));
    
    for j=1:length(runs)
       realdata = load([real_data_dir filesep subs{i} filesep subs{i} '_' runs{j} '_P.mat']);
       realtimeseries = realdata.eventType;
       realtimeSeries{j} = realtimeseries';
    end    
    
    RealTimeSeries{i} = realtimeSeries;
end

% Create empty cell for simulated data time series
SimTimeSeries = cell(1, length(subs));


%Loop through each run of each subject's simulated data to extract opposite
%ROI eventType time series
for i=1:length(subs)
    simtimeSeries = cell(1, length(runs));
    
    for j=1:length(runs)
       simdata = load([sim_data_dir filesep subs{i} filesep subs{i} '_' runs{j} '_P.mat']);
       simtimeseries = simdata.eventType;
       simtimeSeries{j} = simtimeseries';
    end    
    
    SimTimeSeries{i} = simtimeSeries;
end

%% How many brain-triggered events are there in each run of each subject's real data?

% We are grabbing the number of brain-triggered trials of the real data now
% so that once we know how many trials overlapped with simulated opposite
% ROI data, we can understand how frequently these overlapping trials occur
% in our existing data.


%Create cell for number of brain triggered events for each run of every
%subject's real data

RealBrainTrigCounts = cell(1, length(subs));

%Loop through RealTimeSeries to calculate numer of brain-triggered events
%('1's) in each time series

for i=1:length(RealTimeSeries)
    run_BrainTrig = cell(1, length(runs));
    
    for j=1:length(RealTimeSeries{i})
        run_brainTrig = length(find(RealTimeSeries{i}{j} == 1));
        run_BrainTrig{j} = run_brainTrig';
    end
    
    RealBrainTrigCounts{i} = run_BrainTrig;
end    
    
%% What is the total number of brain-triggered trials each subject completed (real data)?

%Create cell for total numbers of brain-triggered trials completed by each
%subject (real data)

RealTotalBrainTrigCounts = cell(1, length(subs));

% Loop through RealBrainTrigCounts to calculate total brain-triggered
% trials in real data of each subject

for i=1:length(RealBrainTrigCounts)
   run_totalBrainTrig = sum([RealBrainTrigCounts{i}{1,:}]);
   RealTotalBrainTrigCounts{i} = run_totalBrainTrig';
end



%% Get brain-triggered trial time stamps for both the real data and the simulation data.


% Create an empty cell for real data trigger time stamps
RealROIEvents = cell(1, length(subs));

% Loop through RealTimeSeries to grab brain-triggered trial time stamps
% (1s)

for i=1:length(RealTimeSeries)
   realROIEvents = cell(1, length(runs));
   
   for j=1:length(RealTimeSeries{i})
       realroievents = find([RealTimeSeries{i}{j}==1]);
       realROIEvents{j} = realroievents';
   end 
   
   RealROIEvents{i} = realROIEvents;
end


% Create an empty cell for simulated data trigger time stamps
SimROIEvents = cell(1, length(subs));

% Loop through SimTimeSeries to grab brain-triggered trial time stamps
% (1s)

for i=1:length(SimTimeSeries)
   simROIEvents = cell(1, length(runs));
   
   for j=1:length(SimTimeSeries{i})
       simroievents = find([SimTimeSeries{i}{j}==1]);
       simROIEvents{j} = simroievents';
   end 
   
   SimROIEvents{i} = simROIEvents;
end

%% What were the time stamps of events that would have been triggered by both ROIS?

% Create empty cell array to store overlapping time stamps

OverlapEvents = cell(1, length(subs));

% use the intersect function to create cell arrays that list overlapping
% events

for i=1:length(RealROIEvents)
    overlapEvents = cell(1, length(runs));
    for j=1:length(RealROIEvents{i})
        overlapevents = intersect([RealROIEvents{i}{j}], [SimROIEvents{i}{j}]);
        overlapEvents{j} = overlapevents';
    end
    OverlapEvents{i} = overlapEvents;
end


% The data cell array of interest for looking at specific time stamps of trials that
% would have been triggered by either ROI is "OverlapEvents".
%% How many overlapping events were there in each run for every subject?

% Create cell array to store counts of overlapping events per run for each
% subject

Run_CountOverlap = cell(1, length(subs));

% Loop through OverlapEvents to count how many overlapping trials there are
% per run in each subject

for i=1:length(OverlapEvents)
    run_countOverlap = cell(1, length(runs));
    for j=1:length(OverlapEvents{i})
        run_countoverlap = length(OverlapEvents{i}{j});
        run_countOverlap{j} = run_countoverlap';
    end
    Run_CountOverlap{i} = run_countOverlap;
    
end

% The data cell array of interest for looking at the number of overlapping
% events per run in each subject is Run_CountOverlap.

%% How many overlapping events did each subject have across all runs?

% Knowing how many overlapping trials each subject had is important so that
% we can see the ratio of true brain triggered events to brain triggered
% events that were likely the result of some sort of global effect.

% Create cell to store total number of overlapping trials per subject

Subj_CountOverlap = cell(1, length(subs));

% Loop through Run_CountOverlap to sum the numbers of overlapping trials in
% each subject

for i=1:length(Run_CountOverlap)
    subj_countOverlap = sum([Run_CountOverlap{i}{1,:}]);
    Subj_CountOverlap{i} = subj_countOverlap';
        
end


%% On average, how many trials would have been also triggered by the opposite ROI across all subjects?

Mean_Subj_CountOverlap = mean([Subj_CountOverlap{1,:}]);



%% Graph ratio of true to overlapping trials in each subject


% Convert cell arrays to numerical
num_RealTotalBrainTrigCounts = cell2mat(RealTotalBrainTrigCounts);
num_Subj_CountOverlap = cell2mat(Subj_CountOverlap);

% After discarding overlapping trials, how many trials remain?
num_RemBrainTrigCounts = num_RealTotalBrainTrigCounts - num_Subj_CountOverlap;

% Make a matrix
barplotdata = [num_Subj_CountOverlap; num_RemBrainTrigCounts]';

% Make a stacked bar plot to show ratio between true and overlapping trials
figure;
bar(barplotdata, 'stacked');

xlabel('Subject', 'FontSize', 30, 'FontWeight', 'bold');
ylabel('Total trial number across all runs', 'FontSize', 30, 'FontWeight', 'bold');
legend({'Overlapping Trials', 'Distinct ROI-triggered trials'}, 'FontSize', 20);
title('Ratio of distinct to overlapping brain-triggered trials per subject', 'FontSize', 30);

xticks(1:15);
xticklabels({'sub-01', 'sub-02', 'sub-03', 'sub-04', 'sub-05', 'sub-06', 'sub-07', 'sub-09',...
    'sub-11', 'sub-14', 'sub-15', 'sub-16', 'sub-17', 'sub-18', 'sub-19'});

ax = gca;

ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;

%% Add sub-ID labels for data arrays of interest for easier viewing

% RealTotalBrainTrigCounts = [subs; RealTotalBrainTrigCounts];
% OverlapEvents = [subs; OverlapEvents];
% Run_CountOverlap = [subs; Run_CountOverlap];
% Subj_CountOverlap = [subs; Subj_CountOverlap];













        
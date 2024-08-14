% Script for analyzing head motion data in preliminary dataset
% Written the week of July 29th 2024 by Tiara Bounyarith

% Looking at head motion in experience sampling runs of the first 14
% subjects (sub-16 not included yet)

% We will exclude trials with FD values greater than 0.25mm in five
% pre-probe volumes.

% !! If running analysis on new subs, update cells ROI_labels, subs_cb1,
% and subs_cb2 !!

% Key Cell Arrays:
% - ROI_TimeExclTrial: all subjects' excluded trials across all runs and trial types labeled by subject and cb order
% - daIC_TimeExclTrial_all: all subjects' excluded daIC trials across daIC runs labeled by subject and cb order
% - PMC_TimeExclTrial_all: all subjects' excluded PMC trials across PMC runs labeled by subject and cb order
% - TimeOut_daICTimeExclTrials_all: all subjects' excluded time-out trials across daIC runs labeled by subject and cb order
% - TimeOut_PMCTimeExclTrials_all: all subjects' excluded time-out trials across PMC runs labeled by subject and cb order
% 
% - CountExclTrials: the number of excluded trials for each run across all subjects
% - CountRemTrials: the number of remaining trials after subtracting excluded trials for each run across all subjects

% Results as of running head motion analyses on first 16 subjects:
%
% - Most subjects did not have excessive head motion, and did not require
% any trials to be excluded! 
% - The following subjects need trials excluded for head motion (** denotes subs who need ...
%   to be excluded from one or more models in final analysis):
%   - sub-01: daIC - 6 ; PMC - 5 ; time-out - 2 (total: 13)
%       - remaining: daIC - 7; PMC - 9 ; time-out - 3 **
%   - sub-02: daIC - 4 ; PMC - 2 ; time-out - 6 (total: 12)
%       - remaining: daIC - 4; PMC - 14; time-out - 3 **
%   - sub-03: daIC - 1 ; PMC - 1 ; time-out - 0 (total: 2)
%       - remaining: daIC - 14; PMC - 16; time-out - 2
%   - sub-04: daIC - 0 ; PMC - 1 ; time-out - 0 (total: 1)
%       - remaining: daIC - 11; PMC - 13; time-out - 0
%   - sub-06: daIC - 0 ; PMC - 2 ; time-out - 0 (total: 2)
%       - remaining: daIC - 17; PMC - 15; time-out - 3


%% Load in data

data_dir = '/Users/tuk54040/Desktop/R21-rtfMRIProject/HeadMotionTest';

%Get list of subjects
subs=dir([data_dir filesep 'sub-*']);
subs={subs.name};

%Make list of subjects with counterbalance orders 1 and 2
subs_cb1 = {'sub-03' 'sub-05' 'sub-06' 'sub-09' 'sub-16' 'sub-17' 'sub-18' 'sub-19'};
subs_cb2 = {'sub-01' 'sub-02' 'sub-04' 'sub-07' 'sub-11' 'sub-14' 'sub-15' 'sub-22'};

%Make list of counterbalance ROI labels
ROI_labels = {'2' '2' '1' '2' '1' '1' '2' '1' '2' '2' '2' '1' '1' '1' '1' '2'};


%Make list of runs

runs={'1', '2', '3', '4', '5', '6'};


%Load in head motion data

HeadMotionRD = cell(1, length(subs));

for i=1:length(subs)
    headMotionRD = cell(1, length(runs));
    
    for j=1:length(runs)
       headmotionrd = load([data_dir filesep subs{i} filesep 'headmotion' filesep runs{j} '_prefiltered_func_data_mcf_rel.rms']);
       headMotionRD{j} = headmotionrd';
    end    
    
    HeadMotionRD{i} = headMotionRD;
end  


%Load in trigger event data

TriggerEvents = cell(1, length(subs));

for i=1:length(subs)
   triggerEvents = cell(1, length(runs));
   
   for j=1:length(runs)
       triggerevents = load([data_dir filesep subs{i} filesep 'triggerevents' filesep subs{i} '_' runs{j} '_P.mat']);
       triggerevents = triggerevents.eventType;
       triggerEvents{j} = triggerevents;
   end
   
   TriggerEvents{i} = triggerEvents; 
    
end    

%% When were events triggered during experience sampling?

TimeStamps = cell(1, length(subs));

for i=1:length(TriggerEvents)
   timeStamps = cell(1, length(runs));
   
   for j=1:length(TriggerEvents{i})
       timestamps = find(TriggerEvents{i}{j} > 0 & TriggerEvents{i}{j} < 5);
       timeStamps{j} = timestamps;
   end
   
   TimeStamps{i} = timeStamps;
    
end

%% How many experience sampling trials were triggered per run per subject?

CountTrials = cell(1, length(subs));

for i=1:length(TriggerEvents)
    countTrials = cell(1,length(runs));
    
    for j=1:length(TriggerEvents{i})
        countrials = length(find(TriggerEvents{i}{j} > 0 & TriggerEvents{i}{j} < 5));
        countTrials{j} = countrials;
    end
    
    CountTrials{i} = countTrials;
    
end    

%% find Head Motion RD values five TRS pre-probe for corresponding ES Time Stamps

PreprobeRD = cell(1, length(subs));

for i=1:length(subs)
    PreprobeRD{i} = cell(1,length(runs));
    
    for j=1:length(runs)
        motionValues = HeadMotionRD{i}{j};
        timeOnset = TimeStamps{i}{j};
        preProbeRD = cell(1, length(timeOnset));
        
        for k=1:length(timeOnset)
            timeonset = timeOnset(k);
            preProbeRD{k} = motionValues(timeonset-5:timeonset-1); 
        end
        
        PreprobeRD{i}{j} = preProbeRD;
    end    
    
end    

%% Find preprobe head motion values that are greater than 0.25mm

ExcludedTrials = cell(1, length(subs));

for i=1:length(PreprobeRD)
    excludedTrials = cell(1, length(runs));
    
    for j=1:length(PreprobeRD{i})
        preproberd = PreprobeRD{i}{j};
        excludedtrials = cell(1,length(preproberd));
        
        for k=1:length(PreprobeRD{i}{j})
            excludedtrials{k} = find(PreprobeRD{i}{j}{k} > 0.25); 
        end   
        
        excludedTrials{j} = excludedtrials; 
    end
    
    ExcludedTrials{i} = excludedTrials;
end    

%% Find timestamps of excluded trials

% Make a cell array indexing the trials that will be excluded

IndexExclTrials = cell(1, length(subs));

for i=1:length(ExcludedTrials)
   indexExclTrials = cell(1, length(runs));
   
   for j=i:length(ExcludedTrials{i})
       indexExclTrials{j} = num2cell(~cellfun(@isempty, ExcludedTrials{i}{j}));
   end    
   IndexExclTrials{i} = indexExclTrials;
end    

% Use indices of excluded trials to find actual time stamps

TimeExclTrials = cell(1, length(subs));

for i=1:length(subs)
   TimeExclTrials{i} = cell(1,length(runs));
   
   for j=1:length(runs)
      index = cell2mat(IndexExclTrials{i}{j});
      timestamp = TimeStamps{i}{j};
      
      findindex = find(index == 1);
      
      timeExclTrials = timestamp(findindex);
      
      TimeExclTrials{i}{j} = timeExclTrials;
   end   
    
end    

%% How many trials are being excluded from each run for each subject?

CountExclTrials = cell(1,length(subs));

for i=1:length(TimeExclTrials)
    countExclTrials = cell(1, length(runs));
    
    for j=1:length(TimeExclTrials{i})
        countExclTrials{j} = length(TimeExclTrials{i}{j});
    end    
    CountExclTrials{i} = countExclTrials;
end    

%% How many remaining trials per run does each subject have after excluding for head motion?

CountRemTrials = cell(1,length(subs));


for i=1:length(subs)
    countRemTrials = cell(1,length(runs));
    
   for j=1:length(runs)
       ogtrials = CountTrials{i}{j};
       excltrials = CountExclTrials{i}{j};
       
       countRemTrials{j} = ogtrials - excltrials;
   end 
   
   CountRemTrials{i} = countRemTrials;
   
end    

%% How many brain triggered trials were there?


%Create cell for number of brain triggered events for each run of every subject
BrainTrigTimeStamps = cell(1, length(subs));

%Loop through TimeSeries to calculate number of brain-triggered events ('1's) in
%each time series

for i=1:length(TriggerEvents)
    run_BrainTrigStamps = cell(1, length(runs));
    
    for j=1:length(TriggerEvents{i})
        run_brainTrigStamps = length(find(TriggerEvents{i}{j} == 1));
        run_BrainTrigStamps{j} = run_brainTrigStamps';
    end
    
    BrainTrigTimeStamps{i} = run_BrainTrigStamps;
end

%% Of these brain triggered trials, how many were PMC / daIC triggered?

ROI_BrainTrigCounts = [BrainTrigTimeStamps; ROI_labels];

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

daIC_BrainTrigCounts_all = [subs; ROI_labels; daIC_BrainTrigCounts_all];
%now that the trials are ordered according to numerical subject ID, we can
%remove the subject ID row

%PMC

PMC_BrainTrigCounts_all = [PMC_BrainTrigCounts_cb1, PMC_BrainTrigCounts_cb2];

pmc_subs = PMC_BrainTrigCounts_all(1,:);

[sortedPMCsubs, sortOrder] = sort(pmc_subs);

sortedPMCtrials = PMC_BrainTrigCounts_all(2, sortOrder);

PMC_BrainTrigCounts_all = sortedPMCtrials;

PMC_BrainTrigCounts_all = [subs; ROI_labels; PMC_BrainTrigCounts_all];

%% How many time-out trials were there?

%Create cell for number of time out events for each run of every subject
TimeOutCounts = cell(1, length(subs));

%Loop through TimeSeries to calculate number of time out events ('2's) in
%each time series

for i=1:length(TriggerEvents)
    run_TimeOut = cell(1, length(runs));
    
    for j=1:length(TriggerEvents{i})
        run_timeOut = length(find(TriggerEvents{i}{j} == 2));
        run_TimeOut{j} = run_timeOut';
    end
    
    TimeOutCounts{i} = run_TimeOut;
end


TimeOutCounts_all = cell(1,length(subs));

for i=1:length(TimeOutCounts)
   timeoutcounts = sum([TimeOutCounts{i}{1,:}]);
   TimeOutCounts_all{i} = timeoutcounts;
end

TimeOutCounts_all = [subs; ROI_labels; TimeOutCounts_all];

%% What were the time stamps for time-out trials?

TimeOutTimeStamps = cell(1, length(subs));

for i=1:length(TriggerEvents)
    run_TimeOutStamp = cell(1, length(runs));
    
    for j=1:length(TriggerEvents{i}) 
        run_timeoutStamp = find(TriggerEvents{i}{j} == 2);
        run_TimeOutStamp{j} = run_timeoutStamp;
    end 
    
    TimeOutTimeStamps{i} = run_TimeOutStamp;
    
end 

%% What are the time stamps for brain-triggered trials?

%Create cell for number of brain triggered events for each run of every subject
BrainTrigTimeStamps = cell(1, length(subs));

%Loop through TimeSeries to calculate number of brain-triggered events ('1's) in
%each time series

for i=1:length(TriggerEvents)
    run_BrainTrigStamps = cell(1, length(runs));
    
    for j=1:length(TriggerEvents{i})
        run_brainTrigStamps = find(TriggerEvents{i}{j} == 1);
        run_BrainTrigStamps{j} = run_brainTrigStamps;
    end
    
    BrainTrigTimeStamps{i} = run_BrainTrigStamps;
end

%% Organize brain triggered time stamps by counterbalance condition

% 
ROI_BrainTrigTimeStamps = [BrainTrigTimeStamps; ROI_labels];

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 1
num_cb1 = sum(strcmp(ROI_labels, '1'));
daIC_BrainTrigTimeStamps_cb1 = cell(1, num_cb1);
PMC_BrainTrigTimeStamps_cb1 = cell(1, num_cb1);

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 2
num_cb2 = sum(strcmp(ROI_labels, '2'));
PMC_BrainTrigTimeStamps_cb2 = cell(1, num_cb2);
daIC_BrainTrigTimeStamps_cb2 = cell(1, num_cb2);


% Loop through ROI_BrainTrigCounts to find stamps
for i = 1:size(ROI_BrainTrigTimeStamps, 2)
    if strcmp(ROI_BrainTrigTimeStamps{2, i}, '1') 
        run_daICtrigs_cb1 = {{[ROI_BrainTrigTimeStamps{1, i}{1, 1}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 3}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 5}]}};
        daIC_BrainTrigTimeStamps_cb1{i} = run_daICtrigs_cb1;
        run_PMCtrigs_cb1 = {{[ROI_BrainTrigTimeStamps{1, i}{1, 2}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 4}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 6}]}};
        PMC_BrainTrigTimeStamps_cb1{i} = run_PMCtrigs_cb1;
    elseif strcmp(ROI_BrainTrigTimeStamps{2, i}, '2')
        run_PMCtrigs_cb2 = {{[ROI_BrainTrigTimeStamps{1, i}{1, 1}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 3}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 5}]}};
        PMC_BrainTrigTimeStamps_cb2{i} = run_PMCtrigs_cb2;
        run_daICtrigs_cb2 = {{[ROI_BrainTrigTimeStamps{1, i}{1, 2}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 4}]}, {[ROI_BrainTrigTimeStamps{1, i}{1, 6}]}};
        daIC_BrainTrigTimeStamps_cb2{i} = run_daICtrigs_cb2;
    end
end


%% Assigning subject labels to time stamp cell arrays

daIC_BrainTrigTimeStamps_cb1 = daIC_BrainTrigTimeStamps_cb1(~cellfun(@isempty, daIC_BrainTrigTimeStamps_cb1));
PMC_BrainTrigTimeStamps_cb1 = PMC_BrainTrigTimeStamps_cb1(~cellfun(@isempty, PMC_BrainTrigTimeStamps_cb1));

daIC_BrainTrigTimeStamps_cb2 = daIC_BrainTrigTimeStamps_cb2(~cellfun(@isempty, daIC_BrainTrigTimeStamps_cb2));
PMC_BrainTrigTimeStamps_cb2 = PMC_BrainTrigTimeStamps_cb2(~cellfun(@isempty, PMC_BrainTrigTimeStamps_cb2));


daIC_BrainTrigTimeStamps_cb1 = [subs_cb1; daIC_BrainTrigTimeStamps_cb1];
PMC_BrainTrigTimeStamps_cb1 = [subs_cb1; PMC_BrainTrigTimeStamps_cb1];

daIC_BrainTrigTimeStamps_cb2 = [subs_cb2; daIC_BrainTrigTimeStamps_cb2];
PMC_BrainTrigTimeStamps_cb2 = [subs_cb2; PMC_BrainTrigTimeStamps_cb2];

%% Concatenate all daIC time stamps and all PMC time stamps

%daIC

daIC_BrainTrigTimeStamps_all = [daIC_BrainTrigTimeStamps_cb1, daIC_BrainTrigTimeStamps_cb2];

daic_subs = daIC_BrainTrigTimeStamps_all(1, :);

[sorteddaICsubs, sortOrder] = sort(daic_subs);

sorteddaICTimeStamps = daIC_BrainTrigTimeStamps_all(2, sortOrder);

daIC_BrainTrigTimeStamps_all = sorteddaICTimeStamps; 

%now that the trials are ordered according to numerical subject ID, we can
%remove the subject ID row

%PMC

PMC_BrainTrigTimeStamps_all = [PMC_BrainTrigTimeStamps_cb1, PMC_BrainTrigTimeStamps_cb2];

pmc_subs = PMC_BrainTrigTimeStamps_all(1,:);

[sortedPMCsubs, sortOrder] = sort(pmc_subs);

sortedPMCTimeStamps = PMC_BrainTrigTimeStamps_all(2, sortOrder);

PMC_BrainTrigTimeStamps_all = sortedPMCTimeStamps;

%% Get the time stamps of all daIC / PMC trials to be excluded

ROI_TimeExclTrial = [TimeExclTrials; ROI_labels; subs];

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 1
num_cb1 = sum(strcmp(ROI_labels, '1'));
daIC_TimeExclTrial_cb1 = cell(1, num_cb1);
PMC_TimeExclTrial_cb1 = cell(1, num_cb1);

% Create cell arrays for total daIC and PMC trials for subjects with counterbalance order 2
num_cb2 = sum(strcmp(ROI_labels, '2'));
PMC_TimeExclTrial_cb2 = cell(1, num_cb2);
daIC_TimeExclTrial_cb2 = cell(1, num_cb2);


% Loop through ROI_BrainTrigCounts to find stamps
for i = 1:size(ROI_TimeExclTrial, 2)
    if strcmp(ROI_TimeExclTrial{2, i}, '1') 
        run_daICtrigs_cb1 = {{intersect(ROI_TimeExclTrial{1, i}{1, 1}, daIC_BrainTrigTimeStamps_all{1,i}{1,1}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 3}, daIC_BrainTrigTimeStamps_all{1,i}{1,2}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 5}, daIC_BrainTrigTimeStamps_all{1,i}{1,3}{1,1})}};
    
        daIC_TimeExclTrial_cb1{i} = run_daICtrigs_cb1;
        
        run_PMCtrigs_cb1 = {{intersect(ROI_TimeExclTrial{1, i}{1, 2}, PMC_BrainTrigTimeStamps_all{1,i}{1,1}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 4}, PMC_BrainTrigTimeStamps_all{1,i}{1,2}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 6}, PMC_BrainTrigTimeStamps_all{1,i}{1,3}{1,1})}};
    
        PMC_TimeExclTrial_cb1{i} = run_PMCtrigs_cb1;
    elseif strcmp(ROI_TimeExclTrial{2, i}, '2')
        run_PMCtrigs_cb2 = {{intersect(ROI_TimeExclTrial{1, i}{1, 1}, PMC_BrainTrigTimeStamps_all{1,i}{1,1}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 3}, PMC_BrainTrigTimeStamps_all{1,i}{1,2}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 5}, PMC_BrainTrigTimeStamps_all{1,i}{1,3}{1,1})}};
        PMC_TimeExclTrial_cb2{i} = run_PMCtrigs_cb2;
        run_daICtrigs_cb2 = {{intersect(ROI_TimeExclTrial{1, i}{1, 2}, daIC_BrainTrigTimeStamps_all{1,i}{1,1}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 4}, daIC_BrainTrigTimeStamps_all{1,i}{1,2}{1,1})},...
            {intersect(ROI_TimeExclTrial{1, i}{1, 6}, daIC_BrainTrigTimeStamps_all{1,i}{1,3}{1,1})}};
        daIC_TimeExclTrial_cb2{i} = run_daICtrigs_cb2;
    end
end


%% Remove empty columns and add subject labels to each counterbalance cell array

daIC_TimeExclTrial_cb1 = daIC_TimeExclTrial_cb1(~cellfun(@isempty, daIC_TimeExclTrial_cb1));
PMC_TimeExclTrial_cb1 = PMC_TimeExclTrial_cb1(~cellfun(@isempty, PMC_TimeExclTrial_cb1));

daIC_TimeExclTrial_cb2 = daIC_TimeExclTrial_cb2(~cellfun(@isempty, daIC_TimeExclTrial_cb2));
PMC_TimeExclTrial_cb2 = PMC_TimeExclTrial_cb2(~cellfun(@isempty, PMC_TimeExclTrial_cb2));


daIC_TimeExclTrial_cb1 = [subs_cb1; daIC_TimeExclTrial_cb1];
PMC_TimeExclTrial_cb1 = [subs_cb1; PMC_TimeExclTrial_cb1];

daIC_TimeExclTrial_cb2 = [subs_cb2; daIC_TimeExclTrial_cb2];
PMC_TimeExclTrial_cb2 = [subs_cb2; PMC_TimeExclTrial_cb2];


%% Create main dataframe for all daIC / PMC Excluded Trials labelled by subject and counterbalance order 

%daIC

daIC_TimeExclTrial_all = [daIC_TimeExclTrial_cb1, daIC_TimeExclTrial_cb2];

daic_subs = daIC_TimeExclTrial_all(1, :);

[sorteddaICsubs, sortOrder] = sort(daic_subs);

sorteddaICTimeStamps = daIC_TimeExclTrial_all(2, sortOrder);

daIC_TimeExclTrial_all = sorteddaICTimeStamps; 

daIC_TimeExclTrial_all = [daIC_TimeExclTrial_all; ROI_labels; subs];

%PMC

PMC_TimeExclTrial_all = [PMC_TimeExclTrial_cb1, PMC_TimeExclTrial_cb2];

pmc_subs = PMC_TimeExclTrial_all(1,:);

[sortedPMCsubs, sortOrder] = sort(pmc_subs);

sortedPMCTimeStamps = PMC_TimeExclTrial_all(2, sortOrder);

PMC_TimeExclTrial_all = sortedPMCTimeStamps;

PMC_TimeExclTrial_all = [PMC_TimeExclTrial_all; ROI_labels; subs];

%% Get time stamps of time-out trials to be excluded



% Create cell arrays for total TimeOut and PMC trials for subjects with counterbalance order 1
num_cb1 = sum(strcmp(ROI_labels, '1'));
TimeOut_daICTimeExclTrial_cb1 = cell(1, 16);
TimeOut_PMCTimeExclTrial_cb1 = cell(1, 16);

% Create cell arrays for total TimeOut and PMC trials for subjects with counterbalance order 2
num_cb2 = sum(strcmp(ROI_labels, '2'));
TimeOut_PMCTimeExclTrial_cb2 = cell(1, 16);
TimeOut_daICTimeExclTrial_cb2 = cell(1, 16);

% Loop through ROI_BrainTrigCounts to find stamps
for i = 1:size(ROI_TimeExclTrial, 2)
    if strcmp(ROI_TimeExclTrial{2, i}, '1') 
        run_daICtrigs_cb1 = {{setdiff([string(ROI_TimeExclTrial{1, i}{1, 1})], [string(daIC_TimeExclTrial_all{1,i}{1,1}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 3})], [string(daIC_TimeExclTrial_all{1,i}{1,2}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 5})], [string(daIC_TimeExclTrial_all{1,i}{1,3}{1,1})])}};
        TimeOut_daICTimeExclTrial_cb1{i} = run_daICtrigs_cb1;
        
        run_PMCtrigs_cb1 = {{setdiff([string(ROI_TimeExclTrial{1, i}{1, 2})], [string(PMC_TimeExclTrial_all{1,i}{1,1}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 4})], [string(PMC_TimeExclTrial_all{1,i}{1,2}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 6})], [string(PMC_TimeExclTrial_all{1,i}{1,3}{1,1})])}};
        TimeOut_PMCTimeExclTrial_cb1{i} = run_PMCtrigs_cb1;

    
    elseif strcmp(ROI_TimeExclTrial{2, i}, '2')
        run_PMCtrigs_cb2 = {{setdiff([string(ROI_TimeExclTrial{1, i}{1, 1})], [string(PMC_TimeExclTrial_all{1,i}{1,1}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 3})], [string(PMC_TimeExclTrial_all{1,i}{1,2}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 5})], [string(PMC_TimeExclTrial_all{1,i}{1,3}{1,1})])}};
        TimeOut_PMCTimeExclTrial_cb2{i} = run_PMCtrigs_cb2;


        run_daICtrigs_cb2 = {{setdiff([string(ROI_TimeExclTrial{1, i}{1, 2})], [string(daIC_TimeExclTrial_all{1,i}{1,1}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 4})], [string(daIC_TimeExclTrial_all{1,i}{1,2}{1,1})])},...
            {setdiff([string(ROI_TimeExclTrial{1, i}{1, 6})], [string(daIC_TimeExclTrial_all{1,i}{1,3}{1,1})])}};
        TimeOut_daICTimeExclTrial_cb2{i} = run_daICtrigs_cb2;
    end
end


%% Remove empty columns and add subject labels to each counterbalance cell array





TimeOut_daICTimeExclTrial_cb1 = TimeOut_daICTimeExclTrial_cb1(~cellfun(@isempty, TimeOut_daICTimeExclTrial_cb1));
TimeOut_PMCTimeExclTrial_cb1 = TimeOut_PMCTimeExclTrial_cb1(~cellfun(@isempty, TimeOut_PMCTimeExclTrial_cb1));

TimeOut_daICTimeExclTrial_cb2 = TimeOut_daICTimeExclTrial_cb2(~cellfun(@isempty, TimeOut_daICTimeExclTrial_cb2));
TimeOut_PMCTimeExclTrial_cb2 = TimeOut_PMCTimeExclTrial_cb2(~cellfun(@isempty, TimeOut_PMCTimeExclTrial_cb2));





TimeOut_daICTimeExclTrial_cb1 = [subs_cb1; TimeOut_daICTimeExclTrial_cb1];
TimeOut_PMCTimeExclTrial_cb1 = [subs_cb1; TimeOut_PMCTimeExclTrial_cb1];

TimeOut_daICTimeExclTrial_cb2 = [subs_cb2; TimeOut_daICTimeExclTrial_cb2];
TimeOut_PMCTimeExclTrial_cb2 = [subs_cb2; TimeOut_PMCTimeExclTrial_cb2];

%%

%daIC

TimeOut_daICTimeExclTrial_all = [TimeOut_daICTimeExclTrial_cb1, TimeOut_daICTimeExclTrial_cb2];

daic_subs = TimeOut_daICTimeExclTrial_all(1, :);

[sorteddaICsubs, sortOrder] = sort(daic_subs);

sortedTimeOutdaICTimeStamps = TimeOut_daICTimeExclTrial_all(2, sortOrder);

TimeOut_daICTimeExclTrial_all = sortedTimeOutdaICTimeStamps; 

TimeOut_daICTimeExclTrial_all = [TimeOut_daICTimeExclTrial_all; ROI_labels; subs];

%PMC

TimeOut_PMCTimeExclTrial_all = [TimeOut_PMCTimeExclTrial_cb1, TimeOut_PMCTimeExclTrial_cb2];

pmc_subs = TimeOut_PMCTimeExclTrial_all(1,:);

[sortedPMCsubs, sortOrder] = sort(pmc_subs);

sortedTimeOutPMCTimeStamps = TimeOut_PMCTimeExclTrial_all(2, sortOrder);

TimeOut_PMCTimeExclTrial_all = sortedTimeOutPMCTimeStamps;

TimeOut_PMCTimeExclTrial_all = [TimeOut_PMCTimeExclTrial_all; ROI_labels; subs];

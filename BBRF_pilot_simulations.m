% Script for analyzing simulation data for BBRF neurofeedback project
% Written July 3rd, 2024 by Tiara Bounyarith

% Simulation Information:
% - n = 15 (from rtfMRI study)
% - Each subject was simulated through the rt-fMRI-NF paradigm once (one
% run; seeking high DAN and low DMN ?) using their resting state data

% Data Information:
% - Triggered events (when the puzzle pieces were triggered by candidate
% activity)
%   - found in _P.mat file
%   - 0 = no trigger
%   - 1 = triggered by DAN increase + DMN decrease
%   - 2 = triggered by DMN increase + DAN decrease 
% - Time Series (time series of BOLD activity as recorded during
% simulation)
%   - found in mainLoopData.m file

%% Load in data

%Set up directories
data_dir = '/Users/tuk54040/Desktop/BBRF_Neurofeedback/Simulations/Prepilot_Simulations/Subjects';


%Get list of subjects
subs=dir([data_dir filesep 'sub-*']);
subs={subs.name};

% Load in event data

EventData = cell(1, length(subs));

for i=1:length(subs)
    eventdata = load([data_dir filesep subs{i} filesep 'OpenNFT' filesep 'Data_Run_1' filesep 'NF_Data_1'...
        filesep subs{i} '_1_P.mat']);
    eventdata = eventdata.eventType;
    EventData{i} = eventdata;
end


%% How many puzzle pieces were filled in for each subject?

% Within eventType, there are two markers for brain-triggered events:
% - 1 = triggered by DAN increase and DMN decrease
% - 2 = triggered by DMN increase and DAN decrease 


% DAN increase, DMN decrease

Event1Count = cell(1, length(subs));

for i = 1:length(EventData)
   event1count = length(find(EventData{i} == 1)); 
   Event1Count{i} = event1count;
end


% DMN increase, DAN decrease

Event2Count = cell(1, length(subs));

for i = 1:length(EventData)
   event2count = length(find(EventData{i} == 2));
   Event2Count{i} = event2count;
end

%% How many total puzzle pieces were triggered for each subject?

TotalEventsCount = cell(1, length(subs));

for i = 1:length(subs)
   TotalEventsCount{i} = Event1Count{i} + Event2Count{i}; 
end

%% Average number of puzzle pieces triggered by subject?

MeanTotalEvents = mean([TotalEventsCount{1,:}]);

% average of 79 puzzle pieces triggered 

%% Bar plot showing total number of puzzle pieces triggered (by event type)


% Convert cell arrays to numerical
num_Event1Count = cell2mat(Event1Count);
num_Event2Count = cell2mat(Event2Count);


% Make a matrix to prepare for plotting
barplotdata = [num_Event1Count; num_Event2Count]';

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
ylabel('Total number of puzzle pieces triggered', 'FontSize', 30, 'FontWeight', 'bold');
legend({'DAN increase, DMN decrease', 'DMN increase, DAN decrease'}, 'FontSize', 18);
title('Number of Puzzle Pieces Triggered (by event type)', 'FontSize', 30);


xticks(1:15);
xticklabels({'sub-01', 'sub-02', 'sub-03', 'sub-04', 'sub-05', 'sub-06', 'sub-07', 'sub-09',...
    'sub-11', 'sub-14', 'sub-15', 'sub-16', 'sub-17', 'sub-18', 'sub-19'});

ax = gca;

ax.XAxis.FontSize = 15;
ax.YAxis.FontSize = 15;

%% 












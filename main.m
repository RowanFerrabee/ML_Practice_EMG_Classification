% % % The following is a demonstation of using signal processing and machine learning techniques
% % % to train a "classifier" to be able to predict grip state from raw emg data.

clc;
clear all;
pkg load signal;

% % % Step 1: Signal Preprocessing

% Read data from CSV files
RAW_DATA = dlmread('./emg_data/working_data.csv',',');

% Bandpass filter data
[FILTERED_DATA] = custom_filter(RAW_DATA);

% Split data by label and select data from center of sample for optimal training

[good_samples] = select_samples(FILTERED_DATA);

data = good_samples(:,1:size(good_samples,2)-1);
labels = good_samples(:,size(good_samples,2));

theta = rand(10,1)

subplot(3,1,1)
plot(RAW_DATA(:,1:size(RAW_DATA,2)-1))
subplot(3,1,2)
plot(FILTERED_DATA(:,1:size(FILTERED_DATA,2)-1))
subplot(3,1,3)
plot(good_samples(:,1:size(good_samples,2)-1))

% % % Step 2: Feature Extraction (Signal Processing)

% Perform FFT on raw data samples using a moving frame

% Calculate power over relevant frequency bands of the samples

% Vectorize the frequency band powers for each electrode. Ex: [electrode1_rel_power_40_60Hz, ..., electrode1_rel_power_150_200Hz, ..., ..., electrodeN_rel_power_40_60Hz, ..., electrodeN_rel_power_150_200Hz]

% Sort these 'feature vectors' with associated labels into a training set (random 80% of these pairs) and a test set (the other 20%)



% % % Step 3: Classifier Training

% Initialize classifier

% Feed feature vectors from training set into classifier with associated labels


% % % Step 4: Classifier Testing

% Feed feature vectors from test set into classifier and check if the output is equal to associated label

% Run statistics on how effectively the data was classified
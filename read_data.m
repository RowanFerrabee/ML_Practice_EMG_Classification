% % % Reads raw emg data from 'folder' and returns it as one large matrix.
% % % Data in 'folder' must be in the format raw_emg_set_1.csv, raw_emg_set_2.csv, ...
% % % each line of the csv files must contain one frame of electrode data followed by the frame's label

function [RAW_DATA] = read_data(folder)

  RAW_DATA = [];

  if exist(folder) != 7
    disp(sprintf("%s is not a folder",folder));

  else
    % Read data sets in order, add them to raw data matrix
    
    i = 1;
    csv_file = sprintf("%sraw_emg_set_%d.csv",folder,i);
 
    while exist(csv_file) != 0
      DATA_SET = dlmread(csv_file,",");
      
      disp(sprintf("data set %d is size %dx%d",i,size(DATA_SET,1),size(DATA_SET,2)));
      
      if (size(RAW_DATA,2) == 0 || size(DATA_SET,2) == size(RAW_DATA,2))
        % Append data set to RAW_DATA
        RAW_DATA = [RAW_DATA ; DATA_SET];
      else
        disp(sprintf("data set %d has an incompatible number of columns (electrodes)",i));
      end
      
      i = i+1;
      csv_file = sprintf("%sraw_emg_set_%d.csv",folder,i);
    end
    
  end
  
end
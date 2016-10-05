% % % This function returns the result of band passing RAW_DATA between low_freq and high_freq (both in Hz)
% % % It is currently assumed that the sampling_freq of data frames is _______Hz, this will be changed.

function [FILTERED_DATA] = custom_filter(RAW_DATA)
  
%  sampling_freq = 200;
%  low_freq = 50;
%  high_freq = 100;
  
%  wl = low_freq/(sampling_freq/2);
%  wh = high_freq/(sampling_freq/2);
  
%  [b,a] = butter(1, [wl, wh]);
  
  % filter emg values and store in FILTERED_DATA
%  FILTERED_DATA = filter(b, a, RAW_DATA(:,1:size(RAW_DATA,2)-1));
  FILTERED_DATA = RAW_DATA(:,1:size(RAW_DATA,2)-1);
  
  for i=1:size(FILTERED_DATA,1)
    for j=1:size(FILTERED_DATA,2)
      if FILTERED_DATA(i,j) < 0
        FILTERED_DATA(i,j) = -1*FILTERED_DATA(i,j);
      end
    end
  end
  
  moving_avg_len = 100;
  for i=1:size(FILTERED_DATA,1)-moving_avg_len
    for j=1:size(FILTERED_DATA,2)
    
      FILTERED_DATA(i,j) = sum(FILTERED_DATA(i:i+moving_avg_len,j))/moving_avg_len;
    end
    
  end

  % append labels back onto data
  FILTERED_DATA = horzcat(FILTERED_DATA, RAW_DATA(1:size(FILTERED_DATA,1),size(RAW_DATA,2)));
  FILTERED_DATA = FILTERED_DATA(1:size(FILTERED_DATA,1)-moving_avg_len,:);
  
end
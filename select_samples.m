function [good_samples] = select_samples(DATA)

  good_samples = [];

  label_start = 1;
  current_label = DATA(1,size(DATA,2));
  
  for i=1:size(DATA,1)
    if DATA(i,size(DATA,2)) != current_label
      % Add samples to feature set
      center = (label_start+i-1)/2;
      for j=-10:10
        good_samples = [good_samples;DATA(round(center+(i-1-label_start)*j/100.0),:)];
      end
      label_start = i;
      current_label = DATA(i,size(DATA,2));
    end
  end
  
end
% % % This function appends all combination of polynomial features of power 'order' or less
% % % Ex: append_features([x; y],2) --> [x; y; x^2; xy; y^2]

function [output] = append_features(input, order)

  output = input;
  dimension = size(input, 1);
  
  if (order == 2)
    for i=1:dimension
      for j=i:dimension
        new_feature = input(i,:) .* input(j,:);
        output = [output; new_feature];
      end
    end
  end
  
end
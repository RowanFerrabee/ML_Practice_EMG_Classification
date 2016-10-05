% % % function returns the theta matrix for a logistic
% % % regression model which maps each column vector in
% % % x_data to each column vector in y_data.
function [theta] = logistic_regress(x_data, y_data, threshold)

  if size(x_data,2) ~= size(y_data,2)
      theta = zeros(size(y_data,1), size(x_data,1));
      return
  end
  
  num_samples = size(y_data,2);
  theta = rand(size(y_data,1), size(x_data,1)+1);

  step_size = 0.001;  % Potentially pass this into the function.
  progress = threshold+1;

  J = cost(x_data, theta, y_data);
  while J > threshold
    
    for i=1:size(theta,1)
        for j=1:size(theta,2)
            theta(i,j) = theta(i,j) + step_size;
            gradient = cost(x_data, theta, y_data) - J;
            theta(i,j) = theta(i,j) - step_size;
            theta(i,j) = theta(i,j) - gradient;
        end
    end
    
    new_cost = cost(x_data, theta, y_data);
    
    if (new_cost > J)
       disp(sprintf('step size too large, reducing by factor of 2'));
       step_size = step_size/2;
    end
    
    J = new_cost
  end

end

function [J] = cost(x_data, theta, y_data)
  % Include Bias Term
    
  z = theta*[ones(1, size(x_data, 2)); x_data];
  h = 0.999.*sigmoid(z);
  
    
  cost = mean(y_data.*(-1*log(h))-(1-y_data).*log(1-h));
    
  % Find better way of determining cost than taking the mean across all samples
  J = mean(cost);
end

function [h] = sigmoid(z)
  h = zeros(size(z)); 
  h = 1.0 ./ (1.0+exp(-z));
end
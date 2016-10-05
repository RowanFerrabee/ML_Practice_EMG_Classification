
  x_data = [
    1, 1, 1, -1, -3, 5, 10;
    1, 1, -1, -1, 3, -2, 10;
  ]

  x_data = append_features(x_data, 2)

  y_data = [
    1, 1, 0, 1, 0, 0, 1;
  ]

  [theta] = logistic_regress(x_data, y_data, 0.01)

  1.0 ./ (1.0+exp(-(theta*[ones(1, size(x_data,2)); x_data])))
  

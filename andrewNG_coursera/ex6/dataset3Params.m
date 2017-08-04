function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

#{
value_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
best_prediction_error = -1;

for i = 1:length(value_vec)
	for j = 1:length(value_vec)
		try_C = value_vec(i);
		try_sigma = value_vec(j);
		model= svmTrain(X, y, try_C, @(x1, x2) gaussianKernel(x1, x2, try_sigma)); 
		predictions = svmPredict(model, Xval);
		prediction_error = mean(double(predictions ~= yval));
		
		if (best_prediction_error == -1 || prediction_error<best_prediction_error)
			best_prediction_error = prediction_error;
			C = try_C;
			sigma = try_sigma;
		endif
	end
end
#}

C = 1;
sigma = 0.1;

fprintf(['Optimum C: %f sigma: %f \n'], C , sigma);
fprintf('Program paused. Press enter to continue.\n');
pause;

% =========================================================================

end

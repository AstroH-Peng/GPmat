function y = cumGaussian(x)

% CUMGAUSSIAN Cummulative distribution for Gaussian.

% IVM

y = 0.5*(1+erf(sqrt(2)/2*x));

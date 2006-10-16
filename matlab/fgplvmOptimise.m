function model = fgplvmOptimise(model, display, iters);

% FGPLVMOPTIMISE Optimise the FGPLVM.
% FORMAT
% DESC takes a given GP-LVM model structure and optimises with
% respect to parameters and latent positions. 
% ARG model : the model to be optimised.
% ARG display : flag dictating whether or not to display
% optimisation progress (set to greater than zero) (default value 1). 
% ARG iters : number of iterations to run the optimiser
% for (default value 2000).
% RETURN model : the optimised model.
%
% SEEALSO : fgplvmCreate, fgplvmLogLikelihood,
% fgplvmLogLikeGradients, fgplvmObjective, fgplvmGradient
% 
% COPYRIGHT : Neil D. Lawrence, 2005, 2006

% FGPLVM


if nargin < 3
  iters = 2000;
  if nargin < 2
    display = 1;
  end
end


params = fgplvmExtractParam(model);

options = optOptions;
if display
  options(1) = 1;
  if length(params) <= 100
    options(9) = 1;
  end
end
options(14) = iters;

if isfield(model, 'optimiser')
  optim = str2func(model.optimiser);
else
  optim = str2func('scg');
end

params = optim('fgplvmObjective', params,  options, ...
               'fgplvmGradient', model);

model = fgplvmExpandParam(model, params);

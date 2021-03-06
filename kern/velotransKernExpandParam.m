function kern = velotransKernExpandParam(kern, params)

% VELOTRANSKERNEXPANDPARAM Create kernel structure from VELOTRANS kernel's parameters.
% FORMAT
% DESC returns a velocity translate kernel structure filled with the
% parameters in the given vector. This is used as a helper function to
% enable parameters to be optimised in, for example, the NETLAB
% optimisation functions.
% ARG kern : the kernel structure in which the parameters are to be
% placed.
% ARG param : vector of parameters which are to be placed in the
% kernel structure.
% RETURN kern : kernel structure with the given parameters in the
% relevant locations.
%
% SEEALSO : velotransKernParamInit, velotransKernExtractParam, kernExpandParam
%
% COPYRIGHT : Neil D. Lawrence, 2011

% KERN

endVal = length(params)-kern.inputDimension+1;
kern = cmpndKernExpandParam(kern, params(1, 1:endVal));
startVal = endVal + 1;
kern.velocity = params(1, startVal:end);

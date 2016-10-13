function [updateX,updateY,updateZ,checkConvergence] = makeADMM(At,b,c,K,cd,Ech,opts)

% CDCS/packages/+cdcs_utils/MAKEADMM.m
%
% Initialize ADMM operators for CDCS. Call the correct initialization routine 
% according to the method specified in opts.solver.

switch lower(opts.solver)
   
    case {'primal', 'dual'}
        [updateX,updateY,updateZ,checkConvergence] = ...
            cdcs_pd.makeADMM(At,b,c,K,cd,Ech,opts);
        
    case {'hsde'}
        [updateX,updateY,updateZ,checkConvergence] = ...
            cdcs_hsde.makeADMM(At,b,c,K,Ech,opts);
    otherwise
        error('Unknown value for ''options.solver''.')
            
end


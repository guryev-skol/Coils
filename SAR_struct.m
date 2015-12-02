% file contains  Structure for storing local SAR


global SAR;


% Tuning parameters
coil_par = struct('Wid', 0.0,...
                  'Len', 0.0,...
                  'Rad', 0.0,...
                  'thickness', 0.0 );
                
                
% Local SAR parameters and respective values               
SAR = struct('Coil_name', 'No Coil selected', ...
             'Coil_type', 'N', ...
             'Cross_section', [], ...
             'Object_type', 'No object selected' ,...
             'Tune_par',coil_par, ...
             'maxSAR', [], ...
             'maxSAR_cut_x',[],...    % cut of region with fixed x 
             'maxSAR_cut_y',[],...    % cut of region with fixed y 
             'maxSAR_cut_z',[],...    % cut of region with fixed z 
             'ind', []);
         
%%
         
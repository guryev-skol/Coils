function optimize_coils()
%
% script for running marie with specific COIL
% and  RHBM settings 

clear all;
clc;


global COIL;
global RHBM;
global SOL;
global SAR;

%% setting paths

if ispc
    coil_path = '~\Desktop\MARIE-master\data\coils\';
    body_path = '~\Desktop\MARIE-master\data\bodies\';
else 
    coil_path = '~/Desktop/MARIE-master/data/coils/';
    body_path = '~/Desktop/MARIE-master/data/bodies/';
end;

%body_name = 'RHBM_HT_5mm.vmm';
body_name = 'DUKE_HEAD_3mm.vmm';


%% setting loop parameters

max_theta = pi/6;
min_theta = -pi/6;
N_theta = 5; 

d_theta = (max_theta - min_theta) / N_theta;

% setting l 
l_min = 0.1;
l_max = 0.2;
N_l = 3;

% setting rad 
rad_min = 0.15;
rad_max = 0.19;
N_rad = 5;

d_l = (l_max - l_min) / N_l;
d_rad = (rad_max - rad_min) / N_rad;

progress = 0;

for i = 1:N_rad
    
    rad = r_min + i * d_rad;
    
    for j =1:N_l 
        
        l = l_min + j * d_l;
        
        % init all structures
        coil_name = cur_coil_name(l, rad);
        
        
        init_marie();
        SAR_struct;


        Load_Coils(coil_name, coil_path);
        Load_RHBM(body_name, body_path);

        % rotations go here
        
        for k = 1:N_theta
        % simulation
        
            theta = theta_min + k * d_theta;
            
            rotate_head(0, 0, theta)   
            MARIE_Solve(theta);
            
            cntr = (i-1) * N_theta * N_l + (j-1)* N_theta + k;
            progress = cntr / N_theta * N_l * N_rad;
            
            disp ('Progress: ');
            disp(progress);
            
        end;
    end;
    
end;



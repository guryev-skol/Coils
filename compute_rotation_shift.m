function  shift = compute_rotation_shift( pillow_shift )
% function computes rotation shift due to change of origin

global RHBM;
global SAR;

z_head_min = -0.10; % lower bound along z-axis  

[z_min, ~] = find_min_z(z_head_min);    % index range for imaging head

[i_x, i_y, i_z] = ind2sub(size(RHBM.epsilon_r), RHBM.idxS);

x_max = 0;
y_max = 0;
%z_max = 0;

for ind = 1:length(i_z)
    
    if(i_z(ind) >= z_min)
        
        x_body = RHBM.r (i_x(ind), i_y(ind), i_z(ind), 1);
        y_body = RHBM.r (i_x(ind), i_y(ind), i_z(ind), 2);
        
        x_max = max(x_max, x_body);
        y_max = max(y_max, y_body);
        
    end;
    
end;


shift_x = max(x_max);
shift_y = max(y_max);

%shift_z = max(z_body);


if(max(shift_x, shift_y) >= SAR.Tune_par.Rad)
    msgbox ('Dimension mismatch! Body is larger than coil!');
    return;
end;

shift = [0; shift_y + pillow_shift; 0];

function rotate_geometry(alpha_x, alpha_y, alpha_z)

global COIL


% set a rotation matrix

R_x = [1 0 0;
       0 cos(alpha_x) sin(alpha_x);
       0 -sin(alpha_x) cos(alpha_x)];
   
R_y = [cos(alpha_y) 0 -sin(alpha_y); 
       0 1 0;
       sin(alpha_y) 0 cos(alpha_y)];
   
R_z = [cos(alpha_z) sin(alpha_z) 0;
       -sin(alpha_z) cos(alpha_z) 0;
       0 0 1];
       
if ~isempty(COIL.type)
    if (COIL.type == 'S')
        
    clear x; clear y; clear x;
        
    x = COIL.node(1,:);
    y = COIL.node(2,:);
    z = COIL.node(3,:);
    
    res = R_z*R_y*R_x*[x;y;z];
    
    COIL.node(1,:) = res(1,:);
    COIL.node(2,:) = res(2,:);
    COIL.node(3,:) = res(3,:);
    
    end;
end;

%COIL.node;
%function visualize(filename)
%function visualize(filename)
%function serves for visualization properties 

list_file = 'files.txt';

if ispc
    SAR_path = '~\Desktop\MARIE-master\SAR';
else
    SAR_path = '~/Desktop/MARIE-master/SAR';
end;

cd (SAR_path);
system('ls > files.txt');

fid = fopen(list_file, 'r');

line = fgets(fid);
term = 'files.txt';

while (line ~= getl(fid))
   
end;

name = filename(1:end-3);
name = strcat(name, 'mat');

if ~exist(name)
    movefile (filename, name);
end;


disp(strcmp(s, name));

load (name);

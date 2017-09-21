% par_long=readtable('59c3cd1c.txt', 'FileType', 'text');
fid=fopen('59c3cd1c.txt');

par_long=textscan(fid, '%*f %f %f ');
fclose(fid);
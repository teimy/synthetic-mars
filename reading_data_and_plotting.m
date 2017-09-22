% par_long=readtable('59c3cd1c.txt', 'FileType', 'text');
fid=fopen('f.out');

par_long=textscan(fid, '%*f %f %f %*s %*s %*s %*s %*s %*s%*s %*s %*s%*s %*s %*s%*s %*s %*s%*s %*s %*s');
fclose(fid);
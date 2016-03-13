addpath('../minclude/leica');
addpath('../minclude/plot');

if ~exist('c', 'var')
    if (~isempty(instrfind)), fclose(instrfind); end
    
    clear all;
    % reads data from RS232 and displays 3D trajactory
    c = LeicaTS30('COM26', 19200, 60);
end

% load data
filename = 'test_vis.mat';
if exist(filename, 'file')
    mfile = matfile(filename);
    meas_lei = mfile.meas_lei;
else
    meas_lei(1).cnt = 1;
end

% get data from tachymeter
fprintf('Wait for Leica...\n');
[meas_lei(meas_lei(1).cnt).idx, meas_lei(meas_lei(1).cnt).x, meas_lei(meas_lei(1).cnt).y, meas_lei(meas_lei(1).cnt).z, meas_lei(meas_lei(1).cnt).t] = c.getSingleMeas('');

% what is this point?
meas_lei(meas_lei(1).cnt).comment = 'pri4';

fprintf('[%d]: x=%.3f y=%.3f z=%.3f time=%.2f s\n', meas_lei(1).cnt, meas_lei(meas_lei(1).cnt).x, meas_lei(meas_lei(1).cnt).y, meas_lei(meas_lei(1).cnt).z, meas_lei(meas_lei(1).cnt).t);

%% init plot
fig5 = figure(111); clf; hold on; grid on;
% img = imread('Bosch_map_RNG_100_7_FAU_Workshop_rot.pgm', 'pgm');
% colormap(gray);

% idx_x0 = 322;
% idx_y0 = 101;
% map.dx = 5e-2;
% map.x_min = -idx_x0 * map.dx;
% map.pts_x = size(img, 2); % number of points in x
% map.dy = 5e-2;
% map.y_min = -idx_y0 * map.dy;
% map.pts_y = size(img, 1); % number of points in y
% imagesc((1 : map.pts_x) * map.dx + map.x_min, (1 : map.pts_y) * map.dy + map.y_min, flipud(img));
% set(gca, 'YDir', 'normal')

offset_z = 0e-2; % [m] offset to show points above map
% plot3(meas_lei.x, meas_lei.y, meas_lei(:).z + offset_z, '.k');
hold on;
for pt = 1 : meas_lei(1).cnt
    if pt == meas_lei(1).cnt
        plot3(meas_lei(meas_lei(1).cnt).x, meas_lei(meas_lei(1).cnt).y, meas_lei(meas_lei(1).cnt).z + offset_z, 'or');
    end
    plot3(meas_lei(pt).x, meas_lei(pt).y, meas_lei(pt).z + offset_z, '.b');
    text(meas_lei(pt).x, meas_lei(pt).y, meas_lei(pt).z + offset_z, meas_lei(pt).comment);
end
xlabel('X');
ylabel('Y');
zlabel('Z');

axis equal tight;
hold on
dragzoom('3d');
meas_lei(1).cnt = meas_lei(1).cnt + 1;

save(filename, 'meas_lei', '-v7.3')

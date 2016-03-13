clear all;

%% includes
includepath = '../minclude';
addpath(sprintf('%s', includepath));
addpath(sprintf('%s/plot', includepath));
addpath(sprintf('%s/lpr', includepath));
addpath(sprintf('%s/leica', includepath));
if isempty(strfind(path, 'matGeom'))
    addpath(sprintf('%s/matGeom', includepath));
    setupMatGeom;
end

%% init plot
fs_fig(8, 1); clf; hold on; grid on; grid minor;
xlabel('X Coordinate in m');
ylabel('Y Coordinate in m');
zlabel('Z Coordinate in m');
axis equal;

%% calculate frame of reference
mfile = matfile(sprintf('test_vis.mat'));
meas_lei_pts = mfile.meas_lei;
for pt = 1 : meas_lei_pts(1).cnt - 1
    fprintf('%s\n', meas_lei_pts(pt).comment);

    % read in reflectors on mobile antenna
    for i = 1 : 4
        if strcmp(meas_lei_pts(pt).comment, sprintf('pri%d', i))
            p_pri(i, :) = [meas_lei_pts(pt).x, meas_lei_pts(pt).y, meas_lei_pts(pt).z];
        end
    end
end
p0 = p_pri(3, :);
p0_new = p_pri(4, :);
px = p_pri(2, :);
pz = p0 + [0, 0, 1];
drawPoint3d(p_pri);

fra_cam = defFrame(p0, px, nan, pz);
fra_cam(1 : 3) = p0_new - [0, 0, 3e-2]; % set center of frame
% fra_cam(1 : 3) = p0; % set center of frame
%drawFrame(fra_cam, 0.5, 2, 15, sprintf('cam'), 'r');
drawFrame(fra_cam, sprintf('cam'), 'r');
dragzoom('3d');

%% read in measurement
fid = fopen('Data_Logged_run2.txt', 'r');
data = fscanf(fid, '%f, %f; %f, %f, %f', [5 Inf]);
fclose(fid);

data = data';
u = data(:, 1);
v = data(:, 2);

meas_lei_rob.x = data(:, 3);
meas_lei_rob.y = data(:, 4);
meas_lei_rob.z = data(:, 5);
p_rob_glo = [meas_lei_rob.x, meas_lei_rob.y, meas_lei_rob.z];

drawPoint3d(p_rob_glo, '.')

%% convert from global to camera frame of reference
bt_glo2cam = createBasisTransform3d('g', fra_cam);
p_rob_rel = transformPoint3d(p_rob_glo, bt_glo2cam);

%% plot in camera frame of reference
fs_fig(9, 1); clf; hold on; grid on; grid minor;
xlabel('X Coordinate in m');
ylabel('Y Coordinate in m');
zlabel('Z Coordinate in m');
axis equal;
drawPoint3d(p_rob_rel, '*');
dragzoom('3d');

%% fit u to x
% fit_u_x = fit(u, p_rob_rel(:, 1), 'poly2');
mfile = matfile(sprintf('poly2_fit_ux.mat'));
fit_u_x = mfile.fit_u_x;
x_cam = u .^ 2 * fit_u_x.p1 + u * fit_u_x.p2 + fit_u_x.p3;
d = distancePoints3d([0, 0, 0], p_rob_rel);
az_cam = asin(x_cam ./ d);
az_cam_deg = rad2deg(az_cam);
% save('poly2_fit_ux.mat', 'fit_u_x', '-7.3');

%% calculate ideal angle
az = atan2(p_rob_rel(:, 1), p_rob_rel(:, 2));
az_deg = rad2deg(az);

%% calculate measured angle
fit_u_az = fit(u, az, 'poly1');
az_meas = u * fit_u_az.p1 + fit_u_az.p2;
az_meas_deg = rad2deg(az_meas);

figure(3); clf; hold on; grid on;
plot(az_deg, 'g')
% plot(az_meas_deg, 'r')
plot(az_cam_deg, 'b')
dragzoom

% err_fit_u_az = az_deg - az_meas_deg;
% rms(err_fit_u_az)
% std(err_fit_u_az)

err_fit_u_x = az_deg - az_cam_deg;
rms(err_fit_u_x)
std(err_fit_u_x)

figure(4); clf; hold on; grid on;
plot(err_fit_u_x, 'b')
dragzoom

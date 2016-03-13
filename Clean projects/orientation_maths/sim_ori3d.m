clear all;

%% includes
includepath = 'minclude';
addpath(sprintf('%s', includepath));
addpath(sprintf('%s/plot', includepath));
if isempty(strfind(path, 'matGeom'))
    addpath(sprintf('%s/matGeom', includepath));
    setupMatGeom;
end

%% define local reference frame
p0_fra_loc = [0.5, 1, 0.5]; % this is where the webcam is, given by tachymeter
px_fra_loc = p0_fra_loc + [1, 1, 1]; % this is its orientation
py_fra_loc = p0_fra_loc + [0, 1, 0]; % this is its orientation
fra_loc = defFrame(p0_fra_loc, px_fra_loc, py_fra_loc, nan); % this is its reference frame
bt_glo2loc = createBasisTransform3d('g', fra_loc); % this is a basis transform from global to webcam ref. frame

%% define 2 points known in both local and global reference frames
p1_glo = [0.5, 2, 0.7]; % first marker with known location in global coordinates
p2_glo = [-1.9, 1.3, 0.8]; % second marker with known location in global coordinates
p1_loc = transformPoint3d(p1_glo, bt_glo2loc); % marker location in the webcam ref. frame calculated in OpenCV
p2_loc = transformPoint3d(p2_glo, bt_glo2loc); % marker location in the webcam ref. frame calculated in OpenCV

%% move points by offset of local reference frame
p1_glo_off = p1_glo - p0_fra_loc; %makes the marker tohave the camera as the reference/origin
p2_glo_off = p2_glo - p0_fra_loc;

%% calc orientation matrix in global
% the origin of the global reference frame and the global positions of the two markers form a reference frame which is calculated here
 px_glo = p1_glo_off;
px_glo = px_glo / norm(px_glo); %%vector divided by its length???
py_tmp = p2_glo_off; %% y initailly py_tmp???
pz_glo = cross(px_glo, py_tmp);
pz_glo = pz_glo / norm(pz_glo); %%global references defined!
py_glo = cross(pz_glo, px_glo);
py_glo = py_glo / norm(py_glo);
Rp_glo = [px_glo; py_glo; pz_glo]; % orientation of marker ref. frame in global

%% calc orientation matrix in local
% the origin of the local reference frame and local positions of the two markers form a reference frame which is calculated here
px_loc = p1_loc; 
px_loc = px_loc / norm(px_loc);
py_tmp = p2_loc;
pz_loc = cross(px_loc, py_tmp);
pz_loc = pz_loc / norm(pz_loc);
py_loc = cross(pz_loc, px_loc);
py_loc = py_loc / norm(py_loc);
Rp_loc = [px_loc; py_loc; pz_loc]; % orientation of marker ref. frame in local

%% calc local frame orientation
% the orientation of the marker ref. frame in global (Rp_glo) is calculated by rotating the marker ref. frame in local (Rp_loc) by the orientation of the webcam (R_fra_loc):
% Rp_glo = Rp_loc * R_fra_loc, where R_fra_loc is unknown and both others are calculated above
R_fra_loc = inv(Rp_loc) * Rp_glo;

%% calc ideal orientation
R_fra_loc_id = [fra_loc(4 : 6); fra_loc(7 : 9); cross(fra_loc(4 : 6), fra_loc(7 : 9))]; % this is the ideal expected orientation of the webcam, here simulated for test
sum(abs(R_fra_loc - R_fra_loc_id)) % compare calculated with ideal

%% plot
p0 = [0, 0, 0];
p0_mat = repmat(p0, 3, 1);
figure(8); clf; hold on; grid on; axis equal;
drawFrame([0, 0, 0, 1, 0, 0, 0, 1, 0], 'fra_{glo}', 'k'); % global ref. frame
drawFrame(fra_loc, 'fra_{loc}', 'r'); % webcam local ref. frame
drawPoint3d(p1_glo, 'Color', 'k'); % first known marker
drawPoint3d(p2_glo, 'Color', 'k'); % second known marker

% orientation of marker ref. frame in global
drawEdge3d(p0_mat, Rp_glo, 'Color', 'c');
drawEdge3d(p0_mat, R_fra_loc_id, 'Color', 'r');
text(Rp_glo(1, 1), Rp_glo(1, 2), Rp_glo(1, 3), 'x', 'Color', 'c');
text(Rp_glo(2, 1), Rp_glo(2, 2), Rp_glo(2, 3), 'y', 'Color', 'c');
text(Rp_glo(3, 1), Rp_glo(3, 2), Rp_glo(3, 3), 'z', 'Color', 'c');

% searched webcam ref. frame
drawEdge3d(p0_mat, R_fra_loc, 'Color', 'g');
text(R_fra_loc(1, 1), R_fra_loc(1, 2), R_fra_loc(1, 3), 'x', 'Color', 'g');
text(R_fra_loc(2, 1), R_fra_loc(2, 2), R_fra_loc(2, 3), 'y', 'Color', 'g');
text(R_fra_loc(3, 1), R_fra_loc(3, 2), R_fra_loc(3, 3), 'z', 'Color', 'g');

dragzoom('3d');

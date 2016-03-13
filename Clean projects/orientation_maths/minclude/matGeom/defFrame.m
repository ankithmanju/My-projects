function frame = defFrame(p0, px, py, pz)

if isempty(strfind(path, 'matGeom'))
    addpath('matGeom/matGeom');
    setupMatGeom;
end

% we want a plane with zero point p0
% and first direction px and second direction py
if isnan(px)
    frame = createPlane(p0, py, pz);
    frame(1:3) = p0; % define 0-point
    vecy = frame(4:6);
    vecz = frame(7:9);
    vecx = vectorCross3d(vecy, vecz);
    frame(4:6) = vecx;
    frame(7:9) = vecy;
elseif isnan(py)
    frame = createPlane(p0, px, pz);
    frame(1:3) = p0; % define 0-point
    vecx = frame(4:6);
    vecz = frame(7:9);
    vecy = vectorCross3d(vecz, vecx);
    frame(7:9) = vecy;
elseif isnan(pz)
    frame = createPlane(p0, px, py);
    frame(1:3) = p0; % define 0-point
else
    frame = createPlane(p0, px, py);
    frame(1:3) = p0; % define 0-point
end

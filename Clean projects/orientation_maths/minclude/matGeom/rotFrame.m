function rotFrame(frame, theta, phi, p0)

p0 = [mu1(1:2)' 0];
px = sph2cart2(pi/2, mu1(3));
py = sph2cart2(pi/2, mu1(3) + pi/2);
pz = sph2cart2(0, 0);
meas_fra.fra_rob = defFrame([0 0 0], px, py, pz);
meas_fra.fra_rob(1:3) = p0;

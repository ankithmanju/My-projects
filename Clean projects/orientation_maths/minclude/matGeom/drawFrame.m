function drawFrame(frame, name, color)

if nargin < 3
    color = 'r';
end

% draw frame
bt_fr2gl = createBasisTransform3d(frame, 'g');
pp0 = transformPoint3d([0, 0, 0], bt_fr2gl);
ppX = transformPoint3d([0.1, 0, 0], bt_fr2gl);
ppY = transformPoint3d([0, 0.1, 0], bt_fr2gl);
ppZ = transformPoint3d([0, 0, 0.1], bt_fr2gl);

drawEdge(pp0, ppX, color);
drawEdge(pp0, ppY, color);
drawEdge(pp0, ppZ, color);
fontsize = 10;
text(ppX(1), ppX(2), ppX(3), 'x', 'Color', color, 'FontSize', fontsize)
text(ppY(1), ppY(2), ppY(3), 'y', 'Color', color, 'FontSize', fontsize)
text(ppZ(1), ppZ(2), ppZ(3), 'z', 'Color', color, 'FontSize', fontsize)
text(pp0(1), pp0(2), pp0(3), name, 'Color', color, 'FontSize', fontsize)

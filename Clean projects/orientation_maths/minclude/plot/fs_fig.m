function [fig] = fs_fig(n, monitor)
% open a full screen figure on left (1) or right (2) monitor, if both monitors have the same size
fullscreen = get(0, 'ScreenSize');
fig = figure(n);
if monitor == 2
    set(fig, 'Position', [fullscreen(3) 0 fullscreen(3) fullscreen(4)]);
else
    set(fig, 'Position', [0 0 fullscreen(3) fullscreen(4)]);
end

function prettyplot(fig, w_wish, h_wish, sf, filename)
% set(0,'DefaultAxesFontName', 'Times New Roman');
% set(0,'DefaultTextFontName', 'Times New Roman');
% set(fig, 'DefaultTextFontSize', 40)
% set(fig, 'DefaultAxesFontSize', 40)

% set(get(gca, 'xlabel'), 'FontSize', 10, 'FontWeight', 'Bold');
% set(get(gca,'ylabel'), 'FontSize', 10, 'FontWeight', 'Bold');
% set(get(gca,'title'), 'FontSize', 10, 'FontWeight', 'Bold');
% set(gca,'FontSize', 16);
% xlabel('x in m');
% ylabel('y in m');
% legend('Measurement', 'Reference');
% title('Top view of the 3D trajectory');

%% pretty plot
set(gca,'GridLineStyle','--');
box on;

%% pretty size
% axis equal tight;
pba = pbaspect; % aspect ratio of axis after axis tight

set(gca, 'Units', 'pixels');
set(gca, 'LineWidth', 1.5);

% set(gca, 'FontWeight', 'Bold');
set(fig, 'color', 'w');

set(gca, 'Units', 'pixels');
pp = get(gca, 'Position');
w = pp(3); % width
h = pp(4); % height
ar = h / w; % aspect ratio
% w_wish = 1000; % 1000 px desired width
w = w_wish;
if h_wish == 0
    pba = pba / pba(2) * w_wish * sf;
    % h = ar * w_wish; % - 80;
    h = pba(2);
else
    h = h_wish;
end
set(fig, 'Position', [100 100 w h]);

set(gca, 'Units', 'normalized');
set(gca, 'OuterPosition', [0 0 1 1]);
set(gca, 'LooseInset', [0,0,0,0]);
% set(fig, 'Renderer', 'painters');

% set(gca, 'Units', 'pixels');
% plotboxpos

% print -dmeta -painters -r300 a.emf
print('-dmeta', '-painters', '-r300', filename)

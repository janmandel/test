function showmod14(v)
% display MODIS14 data
% from loading file converted by geotiff2mat.py
% input 
%   data     MODIS 14 data
%   geo      geotransform from geotiff
%   optional title string

newplot
image('Xdata',[v.lon(1),v.lon(end)],'Ydata',[v.lat(1),v.lat(end)],'Cdata',v.data)
a=gca;set(a,'Ydir','normal')
pixels_fire=[sum(v.data(:)==7),sum(v.data(:)==8),sum(v.data(:)==9)];
colormap(cmapmod14);
xlabel('Longitude (deg)')
ylabel('Latitude (deg)')
if ~exist('s','var'), s='MOD14'; end
t = sprintf('%s %s fire pixels %i %i %i',v.file,...
    datestr(v.time,'yyyy-mm-dd HH:MM:SS'),pixels_fire);
title(t,'Interpreter','none')
grid on
% show fire pixels
% hold on, [i,j,c]=find(data > 6); plot(lat(j),lon(i),'+r'), hold off
end

function [Nmap] = noise_detection(I,t)
% [R,C] = size(I);Nmap = zeros(R,C);Np = [];
% [x1,y1] = find(I < 255*t);
% [x2,y2] = find(I > 255*(1-t));
% for i = 1:numel(x1)
%     Nmap(x1(i),y1(i)) = 1;
%     Np = [Np;I(x1(i),y1(i)),x1(i),y1(i)];
% end
% for i = 1:numel(x2)
%     Nmap(x2(i),y2(i)) = 1;
%     Np = [Np;I(x2(i),y2(i)),x2(i),y2(i)];
% end
%% New Method
Nmap = (I <= 255*t | I >= 255*(1-t));
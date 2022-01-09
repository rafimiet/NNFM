%% NEAREST_NEIGHBOR_FILTERING_METHOD(NNFM)_ALGORITHM
%   Please cite the article:
%   Mohd Rafi Lone, Ekram Khan,
%   A Good Neighbor is A Great Blessing: Nearest Neighbor Filtering Method to Remove Impulse Noise,
%   Journal of King Saud University - Computer and Information Sciences,
%   2022,
%   ISSN 1319-1578,
%   https://doi.org/10.1016/j.jksuci.2021.12.020.
%   (https://www.sciencedirect.com/science/article/pii/S1319157821003669)
%%
clear; clc;
%% INITIALIZE
I = imread('lena.tif'); % reading an image
% I = rgb2gray(I);
[R,C] = size(I);
% RO = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];
RO = 0.7;
t = zeros(1,numel(RO));p = zeros(1,numel(RO));cor = zeros(1,numel(RO));ss = zeros(1,numel(RO));
IEF = zeros(1,numel(RO)); mae = zeros(1,numel(RO));
for i = 1:numel(RO)
    %% NOISE ADDITION
    tic;
    I_n = imnoise(I,'salt & pepper',RO(i));
    %% NOISE DETECTION
    th = 0.05;
    [Nmap] = noise_detection(I_n,th);
    %% NOISE REMOVAL
    Ir = call_NNFM(I_n, Nmap);
    t(i) = toc;
    %% PERFORMANCE EVALUATION
    Ir = uint8(Ir);
    p(i) = psnr(I,Ir);
    cor(i) = corr2(I,Ir);
    ss(i) = ssim(I,Ir);
end
results = [p',ss',cor',t'];
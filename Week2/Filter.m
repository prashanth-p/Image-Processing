clc;
clear all;
close all;

a = imread('Test.gif');
figure, imshow(a);

b = double(a);
figure, imshow(b);

%Filter Characteristics 
v = 1/25;
hlpf = repmat(v,5,5);
disp(hlpf);
c = imfilter(b,hlpf,'replicate');
figure, imshowpair(b,c,'montage');

%Calculate the MSE
accSum = sum((b(:) - c(:)).^2);
numel(b);
mse = accSum/numel(b);
PSNR = 10*log10(65025/mse);

fprintf(1,'The Mean Square Error of the filter is %f\n', mse);
fprintf(1,'The Peak Signal to noise ratio of the filter is %f\n', PSNR);
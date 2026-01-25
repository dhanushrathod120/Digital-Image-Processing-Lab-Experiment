% Name : Nenavath Dhanush Rathod
% BT23ECE120

% Discrete Wavelet Transform (DWT) with Reconstruction
clear;
close all;
clc;

% Read input image
I = imread('spider.jpg');

% Convert to grayscale if RGB
if size(I,3) == 3
    I = rgb2gray(I);
end

I = im2double(I);

% Perform 1-Level DWT
% Using Haar wavelet
[LL, LH, HL, HH] = dwt2(I, 'haar');

% Display Subbands
figure;

subplot(2,3,1);
imshow(I, []);
title('Original Image');

subplot(2,3,2);
imshow(LL, []);
title('LL Subband');

subplot(2,3,3);
imshow(LH, []);
title('LH Subband');

subplot(2,3,5);
imshow(HL, []);
title('HL Subband');

subplot(2,3,6);
imshow(HH, []);
title('HH Subband');


% Image Reconstruction (IDWT)
I_rec = idwt2(LL, LH, HL, HH, 'haar');

figure;
subplot(1,2,1);
imshow(I, []);
title('Original Image');

subplot(1,2,2);
imshow(I_rec, []);
title('Reconstructed Image');

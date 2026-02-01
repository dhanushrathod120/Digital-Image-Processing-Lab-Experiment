% Name : Nenavath Dhanush Rathod
% BT23ECE120

clear all;
close all;
clc;

% Read Image

img = imread('image.png');  
img = double(img);

% Convert RGB to YCbCr
Y  = 0.299*img(:,:,1) + 0.587*img(:,:,2) + 0.114*img(:,:,3);
Cb = -0.168736*img(:,:,1) - 0.331264*img(:,:,2) + 0.5*img(:,:,3) + 128;
Cr = 0.5*img(:,:,1) - 0.418688*img(:,:,2) - 0.081312*img(:,:,3) + 128;

channels = {Y, Cb, Cr};


% Define Compression Levels
% 0.1 = low compression, 0.9 = high compression

compression_levels = [0.1 0.3 0.6 0.9];


% Process each compression level

figure;
num_levels = length(compression_levels);

for k = 1:num_levels
    reconstructed_channels = cell(1,3);
    level = compression_levels(k);
    
    for c = 1:3
        channel = channels{c};
        
        % Haar Wavelet Decomposition
        [LL,LH,HL,HH] = dwt2(channel,'haar');
        
        % Threshold high frequency coefficients
        max_coeff = max(abs([LH(:); HL(:); HH(:)]));
        threshold = level * max_coeff;
        LH(abs(LH) < threshold) = 0;
        HL(abs(HL) < threshold) = 0;
        HH(abs(HH) < threshold) = 0;
        
        % Reconstruction
        recon = idwt2(LL,LH,HL,HH,'haar');
        reconstructed_channels{c} = recon;
    end
    
    % Convert YCbCr back to RGB
    Y  = reconstructed_channels{1};
    Cb = reconstructed_channels{2} - 128;
    Cr = reconstructed_channels{3} - 128;
    
    R = Y + 1.402 * Cr;
    G = Y - 0.344136 * Cb - 0.714136 * Cr;
    B = Y + 1.772 * Cb;
    
    reconstructed_RGB = cat(3,R,G,B);
    reconstructed_RGB = uint8(min(max(reconstructed_RGB,0),255)); % clamp
    
    % Display result
    subplot(2,ceil(num_levels/2),k);
    imshow(reconstructed_RGB);
    title(['Compression Level = ', num2str(level)]);
  
end
% Show Original Image
figure;
imshow(uint8(img));
title('Original Image');

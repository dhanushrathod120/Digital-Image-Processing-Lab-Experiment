% Name : Nenavath Dhanush Rathod 
% BT23ECE120

% Bit Plane Slicing in Digital Image Processing with Reconstruction
close all;
close all; 
clc;

% Read the input image
I = imread('Prabhas.jpg');   % You can use any grayscale image

% Convert to grayscale if image is RGB
if size(I,3) == 3
    I = rgb2gray(I);
end

I = uint8(I);   % Ensure uint8 format

% Display original image
figure;
subplot(4,3,1);
imshow(I);
title('Original Image');

% Store bit planes
bit_planes = zeros(size(I,1), size(I,2), 8);

% Bit plane slicing
for k = 1:8
    % Extract kth bit plane
    bit_planes(:,:,k) = bitget(I, k);
    
% Display bit plane
    subplot(4,3,k+1);
    imshow(bit_planes(:,:,k));
    title(['Bit Plane ', num2str(k)]);
end

% Reconstruction (MSB only)

% Reconstruct using higher bit planes (5 to 8)
reconstructed = ...
    bit_planes(:,:,5)*2^4 + ...
    bit_planes(:,:,6)*2^5 + ...
    bit_planes(:,:,7)*2^6 + ...
    bit_planes(:,:,8)*2^7;

reconstructed = uint8(reconstructed);

% Display reconstructed image
subplot(4,3,10);
imshow(reconstructed);
title('Reconstructed Image (Bits 5–8)');

% Full Reconstruction
full_reconstruction = zeros(size(I));
for k = 1:8
    full_reconstruction = full_reconstruction + bit_planes(:,:,k)*2^(k-1);
end
full_reconstruction = uint8(full_reconstruction);

subplot(4,3,11);
imshow(full_reconstruction);
title('Reconstruction (All Bits)');

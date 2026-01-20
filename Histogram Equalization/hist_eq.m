%% Histogram Equalisation 14 Jan 2026
% Nenavath Dhanush Rathod
% Input: Image
% Output: Image (Histogram Equalised)

%% Defaults
clc;
clear all;
close all;

%% river Example - Hardcoded Histogram Equalisation
myImage = [
 [157, 114,  60,  31,  30,  36,  52,  76],
 [ 74, 167, 114,  35,  43,  56,  73, 104],
 [ 78,  93,  95,  57,  96, 144, 149, 179],
 [ 56,  81,  94, 108, 122, 125, 135, 151],
 [ 76,  80,  81,  72,  74,  82,  79,  89],
 [ 52,  61, 102, 118, 128, 138, 112,  99],
 [ 62, 107, 110,  92, 115, 122,  79,  69],
 [ 77, 125,  99,  46,  61,  78,  61,  72]
];

myImage = cast(myImage, "uint8");
subplot(3,2,1);
imshow(myImage);
title("Original-Image");

eq_img_1 = [0	12	53	32	190	53	174	53
            57	32	12	227	219	202	32	154
            65	85	93	239	251	227	65	158
            73	146	146	247	255	235	154	130
            97	166	117	231	243	210	117	117
            117	190	36	146	178	93	20	170
            130	202	73	20	12	53	85	194
            146	206	130	117	85	166	182	215];

eq_img_1 = cast(eq_img_1, "uint8");
subplot(3,2,2), imshow(eq_img_1), title("Hard-Coded h(v) from WikiPedia");
subplot(3,2,5), imhist(myImage), title("Original Histogram");


%% Self-Built Histogram Equalisation Operation
[R,C] = size(myImage);
counts = imhist(myImage);
cdf_counts = cumsum(counts);
cdf_min = cdf_counts(find(cdf_counts > 0, 1));
L = 256; % 8 bit image
eq_img_2 = zeros(R,C, "uint8");

for row = 1:R
    for col = 1:C
        curr_pixel = myImage(row,col);
        h_v = round(((cdf_counts(curr_pixel + 1) - cdf_min)/((R*C)-cdf_min))*(L-1));
        eq_img_2(row,col) = h_v;
    end
end
subplot(3,2,3), imshow(eq_img_2), title("Self-Built Operator");
subplot(3,2,6), imhist(eq_img_2), title("Equalised Histogram");

%% In-built operator
eq_img_3 = histeq(myImage);
subplot(3,2,4);
imshow(eq_img_3);
title("In-Built Operator");

clear, close all

image1 = imread('D:\Lessons\labsOfMatlab\data\coffee.tif');
image2 = imread('D:\Lessons\labsOfMatlab\data\dark.png');
image3 = imread("data\kodim05.jpg");
image4 = imread("data\tire.png");

whos image1 image2 image3 image4;
%imshow(image1), figure, imshow(image2), figure, imshow(image3), figure, imshow(image4)


gause = imnoise(image1,'gaussian');
imshow(image1)
title('Вихідне зображення');
figure, imshow(gause)
title('Зашумлене зображення');
h = ones(3,3) / 9; J2 = imfilter(gause,h);
figure, imshow(J2), title('Зображення на виході низькочастотного фільтра')
h1 = [-1,-1,-1;-1,9,-1;-1,-1,-1]; J3 = imfilter(gause,h1);
figure, imshow(J3), title('Зображення на виході високочастотного фільтра')

noisy_img_low = imnoise(image1, 'salt & pepper', 0.02); 
noisy_img_medium = imnoise(image1, 'salt & pepper', 0.05);
noisy_img_high = imnoise(image1, 'salt & pepper', 0.1);

figure,
subplot(1, 3, 1), imshow(noisy_img_low), title('Low Density Noise');
subplot(1, 3, 2), imshow(noisy_img_medium), title('Medium Density Noise');
subplot(1, 3, 3), imshow(noisy_img_high), title('High Density Noise');


a = fspecial('unsharp');
b = fspecial('average');
c = fspecial('disk');
d = fspecial('motion');

unsharp_filtered = imfilter(image1,a);
average_filtered = imfilter(image1,b);
disk_filtered = imfilter(image1,c);
motion_filtered = imfilter(image1,d);

figure,
subplot(2, 2, 1), imshow(unsharp_filtered), title('unsharp filtered');
subplot(2, 2, 2), imshow(average_filtered), title('average filtered');
subplot(2, 2, 3), imshow(disk_filtered), title('disk filtered');
subplot(2, 2, 4), imshow(motion_filtered), title('motion filtered');

unsharp_gause = imfilter(gause, a);
unsharp_salt_mid = imfilter(noisy_img_medium, a);
motion_gause = imfilter(gause, d);
motion_salt_mid = imfilter(noisy_img_medium, d);

figure,
subplot(2, 2, 1), imshow(unsharp_gause), title('unsharp gause');
subplot(2, 2, 2), imshow(unsharp_salt_mid), title('unsharp salt mid');
subplot(2, 2, 3), imshow(motion_gause), title('motion gause');
subplot(2, 2, 4), imshow(motion_salt_mid), title('motion salt mid');

% адаптивна вінерівська фільтрація
simple_image = wiener2(image1,[5 5]);
K_gause = wiener2(gause,[5 5]);
K_salt_medium = wiener2(noisy_img_medium,[5 5]);
K_slat_high = wiener2(noisy_img_high,[5 5]);

figure,
subplot(2, 2, 1), imshow(simple_image), title('wiener for image1');
subplot(2, 2, 2), imshow(K_gause), title('wiener for gause');
subplot(2, 2, 3), imshow(K_salt_medium), title('wiener for salt mid');
subplot(2, 2, 4), imshow(K_slat_high), title('wiener for salt high');

% нелінійним медіанним фільтром
M_gause = medfilt2(gause);
M_salt_medium = medfilt2(noisy_img_medium);
M_slat_high = medfilt2(noisy_img_high);

figure,
subplot(1, 3, 1), imshow(M_gause), title('medfilt2 for gause');
subplot(1, 3, 2), imshow(M_salt_medium), title('medfilt2 for salt mid');
subplot(1, 3, 3), imshow(M_slat_high), title('medfilt2 for salt high');
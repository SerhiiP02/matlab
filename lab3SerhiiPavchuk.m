clear, close all

image1 = imread('D:\Lessons\labsOfMatlab\data\coffee.tif');

imshow(image1);
title('Вихідне зображення');
LEN = 21;
THETA = 0;
PSF = fspecial('motion', LEN, THETA);
PSF2 = fspecial('motion', 30, 90);
blurred = imfilter(image1, PSF, 'conv', 'circular');
blurred90 = imfilter(image1, PSF2, 'conv', 'circular');
figure,
subplot(1, 2, 1), imshow(blurred), title('Змазене зашумлене зображення');
subplot(1, 2, 2), imshow(blurred90), title('Змазене під кутом 90 градусів  зображення');

wnr1 = deconvwnr(blurred, PSF, 0);
figure, imshow(wnr1);
title('Відновлене зображення');

gause = imnoise(image1, "gaussian")
figure, imshow(gause);
title('Гаусівське зашумлення')
gause_blurred = imfilter(gause, PSF, 'conv', 'circular');
gause_blurred90 = imfilter(gause, PSF2, 'conv', 'circular');
figure,
subplot(1, 2, 1), imshow(gause_blurred), title('Змазене зашумлене зображення');
subplot(1, 2, 2), imshow(gause_blurred90), title('Змазене під кутом 90 градусів зашумлене зображення');

wnr2 = deconvwnr(gause_blurred, PSF, 0);
figure, imshow(wnr2);
title('Відновлене зашумлене зображення')
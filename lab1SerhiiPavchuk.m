clear, close all

image1 = imread('D:\Lessons\labsOfMatlab\data\coffee.tif');
image2 = imread('D:\Lessons\labsOfMatlab\data\dark.png');
image3 = imread("data\kodim05.jpg");
image4 = imread("data\tire.png");

whos image1 image2 image3 image4;
%imshow(image1), figure, imshow(image2), figure, imshow(image3), figure, imshow(image4)

imwrite(image1, 'D:\Lessons\labsOfMatlab\savings\newCoffee.tif')
imwrite(image2, 'D:\Lessons\labsOfMatlab\savings\newDark.tif')
imwrite(image3, 'savings\newKodim05.tif')
imwrite(image4, 'savings\newTire.tif')

example_imadjust = imadjust(image3);
negative = imadjust(image3, [0, 1], [1, 0], 1.5);
figure, imhist(image3)
title('Вихідна гістограма');
figure, imhist(example_imadjust)
title('Змінена гістограма');
figure, imshow(image3);
title('Вихідне зображення'); 
figure, imshow(example_imadjust); 
title('Контрастоване зображення');
figure, imshow(negative); 
title('Негативне зображення');

help imadjust;
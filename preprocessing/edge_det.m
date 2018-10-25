% Edge detection attempt

clc;
close all;
%Img1 = imread('Dataset_greek.png');
%Img1 = imread('IMG_0004.jpg');
%Img1 = imread('IMG_0006.jpg');
%Img1 = imread('epsilon_2.jpg');
%Img1 = imread('Mu_2.jpg');
%Img1 = imread('Omega_2.jpg');
%Img1 = imread('Lambda_2.jpg');
%Img1 = imread('Nu_2.jpg');
Img1 = imread('Psi_2.jpg');

figure, imshow(Img1), title('Original Image')
I = rgb2gray(Img1);
[x,y] = size(I);
for i = 1:x
    for j = 1:y
        if(I(i,j)>=170)
            I(i,j) = 255;
        end
    end
end
%figure, imshow(I), title('Processed Grayscale Image')
bw1 = edge(I,'canny',0.4);

fill = imfill(bw1,'holes');
%figure;
%imshow(fill)
se1 = strel('line',3,0);
se2 = strel('line',3,90);
composition = imdilate(fill,[se1,se2],'full');
%imshow(composition)


box = regionprops(composition,'Area', 'BoundingBox');
T1 = struct2table(box);
%vars = {'x' 'y' 'w' 'h'};
T2 = splitvars(T1);
T2.Properties.VariableNames = {'Area' 'x' 'y' 'w' 'h'};
T3 = sortrows(T2,3);


len = length(box)
figure, imshow(I),title('Image with Bounding Boxes');
hold on
count = 8432;
for k = 1: height(T3)
  %thisBB = box(k).BoundingBox;
  thisBB = T3{k,{'x' 'y' 'w' 'h'}};
  area = T3{k,{'Area'}};
  if area<1400 && area>600
      r = rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
      'EdgeColor','r','LineWidth',1 );
       crop_box = imcrop(I,thisBB);
       resized_img = imresize(crop_box,[28 28]);
       %file_name = sprintf('img_%d.jpg', count);
       file_name = sprintf('img_%05d.jpg', count);
       count = count+1;
       imwrite(resized_img, file_name);
  end
end
hold off

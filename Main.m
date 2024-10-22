%%
clear all;
clc;
load net   % load the net so we do not need to train every time we execute the code
clc;
N = 10;   % Rows of image
M = 5;     % Colomns of image
image = imread('Examples/3.png');  % Reading the image
figure;
imshow(image); % Here we show the original image using imshow function
title('Original image','color','r');
% Here we transform it to gray scale using rgb2gray function
imgray = rgb2gray(image); % RGB to gray Scale
figure();
imshow(imgray);
title('image in gray scale');
% Then to black and white using im2bw function
imbin = im2bw(imgray,0.5);  % Gray to binary
imbin = 1 - imbin;
[ w h ] = size(imbin);
imbin = bwareaopen(imbin,30);
figure;
imshow(imbin);
title('Binary Image','color','r');
imshow(imbin);
L = bwlabel(imbin);  % Detect labels in image
Iprops=regionprops(L,'BoundingBox','Area', 'Image');  % Image properities
BoundingBoxLetter = cat(1, Iprops.BoundingBox);
count = numel(Iprops);   % Number of letters in the image
figure(1);
Pixel = zeros(count,1);
for i=1: count
    figure(i);
    imshow(Iprops(i).Image); % Showing Every letters after being corped
    [w h] =size(Iprops(i).Image);
    Pixel(i) = w*h;            % Counting Pixek in every letter's image
end
for i=1: count
    Iprops(i).Image =imresize(Iprops(i).Image,[N M]);% Resizing image to 10x5
end
Test = zeros(N*M,count);
for i=1: count
    Test(:,i) = reshape(Iprops(i).Image, [N*M 1]); % Reshaping the image of letters to 50x1 insteadof 10x5 to make it as input to network
end
y1 = net(Test);  % Output of net 
close all;

clc;
rec=[ ];
sentence = [];
for cols = 1:count
    rec = y1(:,cols);
    ind=find(rec==max(rec)); % Finding max index for every vector of output to get the letter
    rec = [];
    if ind==1 
    letter='A';
elseif ind==2
    letter='B';
elseif ind==3
    letter='C';
elseif ind==4
    letter='D';
elseif ind==5
    letter='E';
elseif (ind==6 && Pixel(cols)<190)
    letter='F';
 elseif (ind==6 && Pixel(cols)>=190)
    letter='E';
elseif ind==7
    letter='G';
elseif ind==8
    letter='H';
elseif (ind==9 && Pixel(cols)<55)
    letter='I';
elseif (ind==9 && Pixel(cols)>=55)
    letter='L';
elseif ind==10
    letter='J';
elseif ind==11
    letter='K';
elseif ind==12
    letter='L';
elseif ind==13
    letter='M';
elseif ind==14
    letter='N';
elseif ind==15
    letter='O';
elseif ind==16
    letter='P';
elseif ind==17
    letter='Q';
elseif ind==18
    letter='R';
elseif ind==19
    letter='S';
elseif ind==20
    letter='T';
elseif ind==21
    letter='U';
elseif ind==22
    letter='V';
elseif ind==23
    letter='W';
elseif ind==24
    letter='X';
elseif ind==25
    letter='Y';
elseif ind==26
    letter='Z';
elseif ind==27
     letter =' ';
    %*-*-*-*-*
% Numerals listings.
    end
      if(cols>=2)
       if((BoundingBoxLetter(cols,1) - BoundingBoxLetter(cols-1,3) - BoundingBoxLetter(cols - 1,1))>7.5)
           letter = [' '  letter];
       end
     end   
    sentence = [ sentence letter];
end
sentence % showing sentence

imshow(imbin);  % showing binary image
hold on;
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj,sentence);

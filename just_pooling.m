clc;
clear all
img = imread('701_StillsRaw_full/IMG_8185.jpg');
size(img)

% imshow(img(:,:,:))
img_filtered = zeros(320,426,3);
% maxpool 3*3 for RGB image
for i=1:319
    for j=1:425
        for k=1:3
            img_filtered(i,j,k) =...
                max(max(img((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_filtered = uint8(img_filtered);



img_filtered2 = zeros(106,142,3);
% maxpool 3*3 for RGB image
for i=1:105
    for j=1:141
        for k=1:3
            img_filtered2(i,j,k) =...
                max(max(img_filtered((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_filtered2 = uint8(img_filtered2);



img_filtered3 = zeros(35,47,3);
% maxpool 3*3 for RGB image
for i=1:34
    for j=1:46
        for k=1:3
            img_filtered3(i,j,k) =...
                max(max(img_filtered2((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_filtered3 = uint8(img_filtered3);




img_filtered4 = zeros(11,15,3);
% maxpool 3*3 for RGB image
for i=1:10
    for j=1:14
        for k=1:3
            img_filtered4(i,j,k) =...
                max(max(img_filtered3((i*3):(i*3)+2,(j*3):(j*3)+2,k)));
        end
    end
end
img_filtered4 = uint8(img_filtered4);


subplot(2,3,1), imshow(img);
title('Original image');
xlabel('960 px');
ylabel('1280 px');
subplot(2,3,2), imshow(img_filtered);
title('max pool 1');
xlabel('320 px');
ylabel('426 px');
subplot(2,3,3), imshow(img_filtered2);
title('max pool 2');
xlabel('106 px');
ylabel('142 px');
subplot(2,3,4), imshow(img_filtered3);
title('max pool 3');
xlabel('35 px');
ylabel('47 px');
subplot(2,3,5), imshow(img_filtered4);
title('max pool 4');
xlabel('11 px');
ylabel('15 px');






